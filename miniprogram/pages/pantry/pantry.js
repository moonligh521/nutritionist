const catalog = require("../../data/catalog")
const store = require("../../utils/store")
const { savedRows, copySolved } = require("../../utils/plan")
const { planDay, turn } = require("../../utils/api")

Page({
  data: { foods: [], matches: [], matchNote: "" },
  onShow() {
    const owned = store.read().pantry || []
    this.setData({
      foods: catalog.pantryFoods().map((food) => ({ ...food, on: owned.indexOf(food.id) >= 0 }))
    })
  },
  toggle(event) {
    const id = event.currentTarget.dataset.id
    const foods = this.data.foods.map((food) => food.id === id ? { ...food, on: !food.on } : food)
    this.setData({ foods })
  },
  match() {
    const owned = this.data.foods.filter((food) => food.on).map((food) => food.id)
    if (!owned.length) {
      wx.showToast({ title: "先勾至少一种食材", icon: "none" })
      return
    }
    const saved = store.read()
    turn(owned, saved.profile || null).then((result) => {
      const matches = result.dishes || []
      const unknown = (result.unrecognized || []).join("、")
      const note = [result.fallback, result.explanation, unknown ? `没有对上食材：${unknown}` : ""].filter(Boolean).join(" ")
      this.setData({ matches, matchNote: note })
      if (result.day) {
        const solved = copySolved(result.day)
        const generated = Object.assign({}, saved.generated)
        generated[store.todayKey()] = solved
        store.write({ pantry: owned, generated })
      }
      if (!matches.length) wx.showToast({ title: result.fallback || "这些食材还做不成一道已发布的菜", icon: "none" })
    })
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
