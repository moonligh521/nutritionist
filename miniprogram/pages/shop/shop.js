const catalog = require("../../data/catalog")
const store = require("../../utils/store")

Page({
  data: { dishes: [], foods: [], lines: [], total: 0 },
  onShow() {
    this.render()
  },
  render() {
    const saved = store.read()
    const bought = saved.bought || {}
    const ids = (saved.plate && saved.plate.length ? saved.plate : saved.shop) || []
    const dishes = ids.map((id) => catalog.byId(id)).filter(Boolean)
    const foods = new Map()
    const lines = []
    dishes.forEach((dish) => {
      ;(dish.ingredients || []).forEach((item) => {
        const key = `${item.seasoning ? "调味" : "食材"}:${item.name}`
        const current = foods.get(key) || { key, name: item.name, grams: 0, seasoning: item.seasoning, done: !!bought[key] }
        current.grams += item.grams
        current.done = !!bought[key]
        foods.set(key, current)
      })
      ;(dish.lines || []).forEach((text) => {
        const found = lines.find((item) => item.text === text)
        if (found) found.count += 1
        else lines.push({ text, count: 1, key: `原文:${text}`, done: !!bought[`原文:${text}`] })
      })
    })
    const total = dishes.reduce((sum, dish) => sum + (dish.nutrition.energy || 0), 0)
    this.setData({
      dishes,
      foods: Array.from(foods.values()),
      lines,
      total
    })
  },
  toggle(event) {
    const key = event.currentTarget.dataset.key
    const bought = Object.assign({}, store.read().bought)
    bought[key] = !bought[key]
    store.write({ bought })
    this.render()
  },
  remove(event) {
    const id = event.currentTarget.dataset.id
    const saved = store.read()
    store.write({
      plate: (saved.plate || []).filter((item) => item !== id),
      shop: (saved.shop || []).filter((item) => item !== id)
    })
    this.render()
  }
})
