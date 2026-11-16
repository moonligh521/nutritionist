const catalog = require("../../data/catalog")
const store = require("../../utils/store")

const MEALS = [
  { key: "breakfast", label: "早餐" },
  { key: "lunch", label: "午餐" },
  { key: "dinner", label: "晚餐" }
]

Page({
  data: {
    weekdays: ["一", "二", "三", "四", "五", "六", "日"],
    title: "",
    cells: [],
    selected: "",
    meals: [],
    canCheck: false,
    future: false
  },
  onShow() {
    const now = new Date()
    this.cursor = { year: now.getFullYear(), month: now.getMonth() }
    this.select(store.todayKey())
  },
  prev() {
    const cursor = this.cursor
    const date = new Date(cursor.year, cursor.month - 1, 1)
    this.cursor = { year: date.getFullYear(), month: date.getMonth() }
    this.paint()
  },
  next() {
    const cursor = this.cursor
    const date = new Date(cursor.year, cursor.month + 1, 1)
    this.cursor = { year: date.getFullYear(), month: date.getMonth() }
    this.paint()
  },
  pick(event) {
    const key = event.currentTarget.dataset.key
    if (key) this.select(key)
  },
  select(key) {
    this.selectedKey = key
    this.paint()
  },
  paint() {
    const { year, month } = this.cursor
    const checkins = store.read().checkins || {}
    const today = store.todayKey()
    const first = new Date(year, month, 1)
    const lead = (first.getDay() + 6) % 7
    const count = new Date(year, month + 1, 0).getDate()
    const cells = []
    for (let i = 0; i < lead; i++) cells.push({ key: `e${i}` })
    for (let day = 1; day <= count; day++) {
      const key = store.dateKey(new Date(year, month, day))
      const record = checkins[key] || {}
      cells.push({
        key,
        day,
        current: key === today,
        breakfast: !!record.breakfast,
        lunch: !!record.lunch,
        dinner: !!record.dinner
      })
    }
    const selected = this.selectedKey || today
    const record = checkins[selected] || {}
    this.setData({
      title: `${year}年${month + 1}月`,
      cells,
      selected,
      canCheck: selected <= today,
      future: selected > today,
      meals: MEALS.map((meal) => ({ ...meal, record: record[meal.key] || null }))
    })
  },
  shoot(event) {
    const slot = event.currentTarget.dataset.slot
    wx.chooseMedia({
      count: 1,
      mediaType: ["image"],
      sourceType: ["album", "camera"],
      success: (result) => {
        const temp = result.tempFiles[0].tempFilePath
        wx.getFileSystemManager().saveFile({
          tempFilePath: temp,
          success: (saved) => this.saveSlot(slot, { image: saved.savedFilePath, source: "photo" }),
          fail: () => this.saveSlot(slot, { image: temp, source: "photo" })
        })
      }
    })
  },
  useMenu(event) {
    const slot = event.currentTarget.dataset.slot
    if (this.selectedKey !== store.todayKey()) {
      wx.showToast({ title: "只有今天能用今日菜单", icon: "none" })
      return
    }
    const saved = store.read()
    const swaps = (saved.swaps && saved.swaps[this.selectedKey]) || {}
    const names = entries(saved.generated && saved.generated[this.selectedKey], slot, swaps)
    if (!names.length) {
      wx.showToast({ title: "今天还没有配好的菜单", icon: "none" })
      return
    }
    this.saveSlot(slot, { text: names.join("、"), source: "menu" })
  },
  clear(event) {
    const slot = event.currentTarget.dataset.slot
    const saved = store.read()
    const checkins = Object.assign({}, saved.checkins)
    const record = Object.assign({}, checkins[this.selectedKey])
    delete record[slot]
    checkins[this.selectedKey] = record
    store.write({ checkins })
    this.paint()
  },
  saveSlot(slot, patch) {
    const saved = store.read()
    const checkins = Object.assign({}, saved.checkins)
    const record = Object.assign({}, checkins[this.selectedKey])
    const previous = record[slot] || {}
    record[slot] = Object.assign({}, previous, patch, { text: patch.text || previous.text || "" })
    checkins[this.selectedKey] = record
    store.write({ checkins })
    this.paint()
  }
})

function entries(day, slot, swaps) {
  const value = day && day[slot]
  const source = Array.isArray(value) ? value : value ? [value] : []
  return source.map((item, index) => {
    const id = typeof item === "string" ? item : item && item.id
    const recipe = catalog.byId(swaps[`${slot}-${index}`] || id)
    if (recipe) return recipe.name
    return item && item.name
  }).filter(Boolean)
}
