const store = require("../../utils/store")
const { savedRows, copySolved } = require("../../utils/plan")
const { planDay } = require("../../utils/api")

Page({
  data: { tab: "week", rows: [], monthCells: [], customDays: 7 },
  onLoad(query) {
    if (query.tab) this.setData({ tab: query.tab })
  },
  onShow() {
    this.paint()
  },
  setTab(event) {
    this.setData({ tab: event.currentTarget.dataset.tab })
    this.paint()
  },
  setDays(event) {
    this.setData({ customDays: Number(event.currentTarget.dataset.days) })
  },
  paint() {
    const saved = store.read()
    const days = this.data.tab === "custom" ? this.data.customDays : (this.data.tab === "month" ? 31 : 7)
    const rows = savedRows(saved.generated, new Date(), days)
    const now = new Date()
    const lead = (new Date(now.getFullYear(), now.getMonth(), 1).getDay() + 6) % 7
    const count = new Date(now.getFullYear(), now.getMonth() + 1, 0).getDate()
    const planned = {}
    rows.forEach((row) => { planned[row.key] = true })
    const monthCells = []
    for (let i = 0; i < lead; i++) monthCells.push({ key: `e${i}` })
    for (let day = 1; day <= count; day++) {
      const key = store.dateKey(new Date(now.getFullYear(), now.getMonth(), day))
      monthCells.push({ key, day, on: !!(saved.generated && saved.generated[key]) })
    }
    this.setData({ rows: this.data.tab === "month" ? [] : rows, monthCells })
  },
  makeCustom() {
    const saved = store.read()
    if (!saved.profile) {
      wx.showToast({ title: "先在目标里记下年龄", icon: "none" })
      return
    }
    planDay(saved.profile, saved.pantry || []).then((day) => {
      if (!day) {
        wx.showToast({ title: "按这个额度和食材配不出完整的一天", icon: "none" })
        return
      }
      const solved = copySolved(day)
      const rows = savedRows(null, new Date(), this.data.customDays)
      const generated = Object.assign({}, saved.generated)
      rows.forEach((row) => { generated[row.key] = solved })
      store.write({ generated })
      wx.showToast({ title: "已按额度记下", icon: "none" })
      this.paint()
    })
  }
})
