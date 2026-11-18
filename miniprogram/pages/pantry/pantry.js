const catalog = require("../../data/catalog")
const store = require("../../utils/store")
const { savedRows, copySolved } = require("../../utils/plan")
const { planDay, turn, warmup } = require("../../utils/api")

Page({
  data: {
    foods: [],
    matches: [],
    matchNote: "",
    memoryAnswer: "",
    chatText: "",
    dishSlots: []
  },
  onShow() {
    const owned = store.read().pantry || []
    this.setData({
      foods: catalog.pantryFoods().map((food) => ({ ...food, on: owned.indexOf(food.id) >= 0 }))
    })
  },
  onChatInput(event) {
    this.setData({ chatText: event.detail.value || "" })
  },
  toggle(event) {
    const id = event.currentTarget.dataset.id
    const foods = this.data.foods.map((food) => food.id === id ? { ...food, on: !food.on } : food)
    this.setData({ foods })
  },
  match() {
    const owned = this.data.foods.filter((food) => food.on)
    const foodIds = owned.map((food) => food.id)
    const foodNames = owned.map((food) => food.name)
    const text = (this.data.chatText || "").trim()
    if (!foodIds.length && !text) {
      wx.showToast({ title: "先勾食材或说一句话", icon: "none" })
      return
    }
    const saved = store.read()
    const utterance = text || ("请根据这些食材推荐：" + foodNames.join("、"))
    const app = getApp()
    const sessionId = (app && app.globalData && app.globalData.sessionId) || ""
    const patientId = (app && app.globalData && app.globalData.patientId) || wx.getStorageSync("nutritionPatientId") || ""
    // 先打真实 warmup，再 SSE turns（与问餐页同一套接口）
    warmup({ sessionId, patientId }).then(() => turn({
      foods: foodNames.length ? foodNames : foodIds,
      profile: saved.profile || null,
      text: utterance,
      sessionId,
      patientId
    })).then((pack) => {
      const result = (pack && pack.reply) || pack || {}
      const matches = result.dishes || []
      const unknown = (result.unrecognized || []).join("、")
      const allergy = (result.allergySuspects || []).map((item) => item.subject).filter(Boolean).join("、")
      const note = [
        result.fallback,
        result.explanation,
        result.rememberedHint,
        unknown ? `没有对上食材：${unknown}` : "",
        allergy ? `过敏嫌疑待确认：${allergy}` : "",
        result.phase ? `阶段 ${result.phase}` : "",
        result.emptyReason ? `空因 ${result.emptyReason}` : ""
      ].filter(Boolean).join(" ")
      this.setData({
        matches,
        matchNote: note,
        memoryAnswer: result.memoryAnswer || "",
        dishSlots: result.dishSlots || [],
        chatText: ""
      })
      if (result.sessionId) {
        if (app && app.globalData) app.globalData.sessionId = result.sessionId
        wx.setStorageSync("nutritionSessionId", result.sessionId)
      }
      if (result.day) {
        const solved = copySolved(result.day)
        const generated = Object.assign({}, saved.generated)
        generated[store.todayKey()] = solved
        store.write({ pantry: foodIds, generated })
      }
      if (!matches.length) wx.showToast({ title: result.fallback || "这些食材还做不成一道已发布的菜", icon: "none" })
    })
  },
  goAskMeal() {
    wx.navigateTo({ url: "/pages/askmeal/askmeal" })
  },
  make() {
    const owned = this.data.foods.filter((food) => food.on).map((food) => food.id)
    if (!owned.length) {
      wx.showToast({ title: "先勾至少一种食材", icon: "none" })
      return
    }
    const saved = store.read()
    if (!saved.profile) {
      wx.showToast({ title: "先在目标里记下年龄", icon: "none" })
      return
    }
    planDay(saved.profile, owned).then((day) => {
      if (!day) {
        wx.showToast({ title: "按这个额度和食材配不出完整的一天", icon: "none" })
        return
      }
      const solved = copySolved(day)
      const generated = Object.assign({}, saved.generated)
      savedRows(null, new Date(), 31).forEach((row) => { generated[row.key] = solved })
      store.write({
        pantry: owned,
        generated,
        planMeta: { days: 31, slots: ["breakfast", "lunch", "dinner"] }
      })
      wx.showToast({ title: "已按额度配好这一个月", icon: "none" })
      setTimeout(() => wx.redirectTo({ url: "/pages/plan/plan?tab=week" }), 400)
    })
  }
})
