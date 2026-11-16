const catalog = require("../../data/catalog")
const store = require("../../utils/store")

Page({
  data: {
    keyword: "",
    sortIndex: 0,
    sorts: ["热量从低到高", "热量从高到低", "蛋白质从高到低"],
    rows: [],
    plate: [],
    plateNames: "",
    plateEnergy: 0,
    suggestion: []
  },
  onShow() {
    const plate = store.read().plate || []
    this.setData({ plate, plateNames: namesOf(plate), plateEnergy: energyOf(plate) })
    this.apply()
  },
  onSort(event) {
    this.setData({ sortIndex: Number(event.detail.value) })
    this.apply()
  },
  search(event) {
    this.setData({ keyword: event.detail.value })
    this.apply()
  },
  apply() {
    const { keyword, sortIndex, plate } = this.data
    const rows = catalog.list("weight").filter((recipe) => {
      return !keyword || recipe.name.indexOf(keyword.trim()) >= 0
    }).sort((left, right) => {
      if (sortIndex === 1) return right.nutrition.energy - left.nutrition.energy
      if (sortIndex === 2) return (right.nutrition.protein || 0) - (left.nutrition.protein || 0)
      return left.nutrition.energy - right.nutrition.energy
    })
      .map((recipe) => ({
        ...recipe,
        added: plate.indexOf(recipe.id) >= 0,
        thumb: recipe.cover || (recipe.ingredients[0] && recipe.ingredients[0].image) || ""
      }))
    this.setData({ rows })
  },
  add(event) {
    const id = event.currentTarget.dataset.id
    const plate = (store.read().plate || []).slice()
    const at = plate.indexOf(id)
    if (at >= 0) plate.splice(at, 1)
    else plate.push(id)
    store.write({ plate })
    this.setData({ plate, plateNames: namesOf(plate), plateEnergy: energyOf(plate), suggestion: [] })
    this.apply()
  },
  compose() {
    const picked = (store.read().plate || []).map((id) => catalog.byId(id)).filter(Boolean)
    if (!picked.length) return
    const pool = catalog.list(picked[0].category)
    const suggestion = fillMeal(picked, pool)
    this.setData({ suggestion })
  },
  closeSuggestion() {
    this.setData({ suggestion: [] })
  },
  open(event) {
    wx.navigateTo({ url: `/pages/recipe/recipe?id=${event.currentTarget.dataset.id}` })
  },
  toShop() {
    const ids = this.data.suggestion.map((item) => item.id)
    const shop = Array.from(new Set((store.read().shop || []).concat(ids)))
    store.write({ shop, plate: ids })
    wx.navigateTo({ url: "/pages/shop/shop" })
  },
  toToday() {
    const [breakfast, lunch, dinner] = this.data.suggestion
    const day = store.todayKey()
    const saved = store.read()
    const generated = Object.assign({}, saved.generated)
    generated[day] = {
      breakfast: breakfast && breakfast.id,
      lunch: lunch && lunch.id,
      dinner: dinner && dinner.id
    }
    store.write({ generated, plate: this.data.suggestion.map((item) => item.id) })
    wx.redirectTo({ url: "/pages/today/today" })
  }
})

function namesOf(ids) {
  return ids.map((id) => catalog.byId(id)).filter(Boolean).map((recipe) => recipe.name).join("、")
}

function energyOf(ids) {
  return ids.reduce((sum, id) => {
    const recipe = catalog.byId(id)
    return sum + (recipe && recipe.nutrition ? recipe.nutrition.energy : 0)
  }, 0)
}

function roleOf(recipe) {
  const name = recipe.name
  if (/饭|面|粥|饼|馒头|包子|饺|粉|馍/.test(name)) return "staple"
  if (/汤|羹/.test(name)) return "soup"
  if (/肉|鸡|鱼|虾|蛋|豆腐|牛|羊|鸭|排|肘|蹄/.test(name)) return "protein"
  return "side"
}

function fillMeal(picked, pool) {
  const result = []
  const seen = {}
  const push = (recipe) => {
    if (!recipe || seen[recipe.id] || result.length >= 3) return
    seen[recipe.id] = true
    result.push(recipe)
  }
  const wanted = ["staple", "protein", "side"]
  wanted.forEach((role) => {
    const own = picked.find((recipe) => roleOf(recipe) === role)
    if (own) push(own)
  })
  picked.forEach(push)
  const cuisine = picked[0].cuisine
  wanted.forEach((role) => {
    if (result.some((recipe) => roleOf(recipe) === role)) return
    push(pool.find((recipe) => roleOf(recipe) === role && recipe.cuisine === cuisine))
    push(pool.find((recipe) => roleOf(recipe) === role))
  })
  pool.forEach((recipe) => {
    if (recipe.cuisine === cuisine) push(recipe)
  })
  return result.slice(0, 3)
}
