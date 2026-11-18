const catalog = require("../../data/catalog")
const store = require("../../utils/store")
const { suggest } = require("../../utils/nutrition")
const { planDay } = require("../../utils/api")

const SLOTS = [
  { key: "breakfast", title: "早餐", share: "全天 30%" },
  { key: "lunch", title: "午餐", share: "全天 40%" },
  { key: "dinner", title: "晚餐", share: "全天 30%" }
]

const DEFAULT_BOARD = { people: 1, breakfast: 2, lunch: 3, dinner: 3, salt: 0 }

Page({
  data: {
    notice: getApp().globalData.notice,
    budget: null,
    eaten: { protein: 0, fat: 0, carb: 0, energy: 0 },
    slots: [],
    board: DEFAULT_BOARD
  },
  onShow() {
    const saved = store.read()
    const day = store.todayKey()
    const generated = saved.generated && saved.generated[day]
    const hasDishes = generated && ["breakfast", "lunch", "dinner"].some((key) => idsOf(generated[key], []).length)
    if (!hasDishes && saved.profile && catalog.list("weight").length) {
      this.fill(Object.assign({}, DEFAULT_BOARD, saved.board))
      return
    }
    this.render()
  },
  render() {
    const saved = store.read()
    const day = store.todayKey()
    const board = Object.assign({}, DEFAULT_BOARD, saved.board)
    const swaps = (saved.swaps && saved.swaps[day]) || {}
    const eatenIds = (saved.eaten && saved.eaten[day]) || []
    const plate = saved.plate || []
    const generated = (saved.generated && saved.generated[day]) || {}
    const slots = SLOTS.map((slot) => {
      const base = entriesOf(generated[slot.key], [])
      const dishes = base.map((entry, index) => {
        const recipe = catalog.byId(swaps[`${slot.key}-${index}`] || entry.id)
        if (!recipe) return null
        const solved = entry.ingredients ? entry : null
        return {
          ...recipe,
          ingredients: solved ? solved.ingredients.map((item) => ({
            foodId: item.foodId,
            name: item.name,
            grams: Math.round(Number(item.grams)),
            seasoning: catalog.seasoningIds.indexOf(item.foodId) >= 0,
            image: (catalog.foods[item.foodId] && catalog.foods[item.foodId].image) || ""
          })) : recipe.ingredients,
          nutrition: solved ? Object.assign({}, recipe.nutrition, { energy: entry.energy }) : recipe.nutrition,
          cover: recipe.cover || (recipe.ingredients[0] && recipe.ingredients[0].image) || "",
          brief: brief(solved ? { ingredients: solved.ingredients.map((item) => ({ name: item.name, grams: Math.round(Number(item.grams)), seasoning: catalog.seasoningIds.indexOf(item.foodId) >= 0 })) } : recipe),
          eaten: eatenIds.indexOf(recipe.id) >= 0,
          onTable: plate.indexOf(recipe.id) >= 0
        }
      }).filter(Boolean)
      return {
        ...slot,
        count: board[slot.key],
        dishes,
        energy: dishes.reduce((sum, dish) => sum + (dish.nutrition.energy || 0), 0)
      }
    })
    const used = slots.flatMap((slot) => slot.dishes).filter((dish) => dish.eaten)
    const eaten = used.reduce((sum, dish) => ({
      energy: sum.energy + dish.nutrition.energy,
      protein: round(sum.protein + dish.nutrition.protein),
      carb: round(sum.carb + dish.nutrition.carb),
      fat: round(sum.fat + dish.nutrition.fat)
    }), { energy: 0, protein: 0, carb: 0, fat: 0 })
    const budget = saved.profile ? suggest(saved.profile) : null
    const planned = slots.reduce((sum, slot) => sum + slot.energy, 0)
    const target = budget ? budget.energy : 0
    const ring = target ? Math.min(100, Math.round((eaten.energy / target) * 100)) : 0
    this.setData({
      date: day.slice(5),
      budget: budget || {},
      eaten,
      planned,
      people: board.people,
      dayTotal: planned * board.people,
      ring,
      remainText: budget ? `${budget.energy - eaten.energy} 千卡` : "—",
      pantryText: (saved.pantry || []).length ? `已选 ${saved.pantry.length} 种，生成一周和今天的三餐` : "勾选冰箱里有的，生成完整三餐",
      board,
      slots
    })
  },
  bump(event) {
    const key = event.currentTarget.dataset.key
    const delta = Number(event.currentTarget.dataset.delta)
    const saved = store.read()
    const board = Object.assign({}, DEFAULT_BOARD, saved.board)
    const limits = { people: [1, 8], breakfast: [1, 3], lunch: [1, 4], dinner: [1, 4] }
    const next = Math.min(limits[key][1], Math.max(limits[key][0], board[key] + delta))
    if (next === board[key]) return
    board[key] = next
    store.write({ board })
    if (key === "people") this.render()
    else this.fill(board)
  },
  reshuffle() {
    const saved = store.read()
    const board = Object.assign({}, DEFAULT_BOARD, saved.board, { salt: ((saved.board && saved.board.salt) || 0) + 1 })
    this.fill(board)
  },
  fill(board) {
    const saved = store.read()
    const profile = saved.profile
    if (!profile) {
      wx.showToast({ title: "先在目标里记下年龄", icon: "none" })
      this.render()
      return
    }
    planDay(profile, saved.pantry || []).then((day) => {
      if (!day) {
        wx.showToast({ title: "按这个额度和食材配不出完整的一天", icon: "none" })
        this.render()
        return
      }
      const generated = Object.assign({}, saved.generated)
      generated[store.todayKey()] = {
        breakfast: day.breakfast || [],
        lunch: day.lunch || [],
        dinner: day.dinner || []
      }
      const swaps = Object.assign({}, saved.swaps)
      swaps[store.todayKey()] = {}
      store.write({ board, generated, swaps })
      this.render()
    })
  },
  swap(event) {
    const { slot, index } = event.currentTarget.dataset
    const current = this.data.slots.find((item) => item.key === slot).dishes[index]
    if (!current) return
    const pool = catalog.list(current.category || "weight")
    const at = pool.findIndex((recipe) => recipe.id === current.id)
    const next = pool[(at + 1) % pool.length]
    const saved = store.read()
    const day = store.todayKey()
    const swaps = Object.assign({}, saved.swaps)
    swaps[day] = Object.assign({}, swaps[day], { [`${slot}-${index}`]: next.id })
    store.write({ swaps })
    this.render()
  },
  toTable(event) {
    const id = event.currentTarget.dataset.id
    const plate = (store.read().plate || []).slice()
    if (plate.indexOf(id) < 0) plate.push(id)
    store.write({ plate })
    wx.showToast({ title: "已放上餐桌", icon: "none" })
    this.render()
  },
  eat(event) {
    const { id, slot } = event.currentTarget.dataset
    const saved = store.read()
    const day = store.todayKey()
    const eaten = Object.assign({}, saved.eaten)
    const ids = (eaten[day] || []).slice()
    const at = ids.indexOf(id)
    if (at >= 0) ids.splice(at, 1)
    else ids.push(id)
    eaten[day] = ids
    const names = this.data.slots.find((item) => item.key === slot).dishes
      .filter((dish) => ids.indexOf(dish.id) >= 0)
      .map((dish) => `${dish.name} ${dish.nutrition.energy}千卡`)
    const checkins = Object.assign({}, saved.checkins)
    const record = Object.assign({}, checkins[day])
    if (names.length) {
      record[slot] = Object.assign({}, record[slot], {
        text: names.join("、"),
        source: record[slot] && record[slot].image ? "photo" : "menu"
      })
    } else if (!record[slot] || !record[slot].image) {
      delete record[slot]
    }
    checkins[day] = record
    store.write({ eaten, checkins })
    this.render()
  },
  open(event) {
    wx.navigateTo({ url: `/pages/recipe/recipe?id=${event.currentTarget.dataset.id}` })
  },
  goAskMeal() {
    wx.navigateTo({ url: "/pages/askmeal/askmeal" })
  },
  goPantry() {
    wx.navigateTo({ url: "/pages/pantry/pantry" })
  },
  goBudget() {
    wx.navigateTo({ url: "/pages/budget/budget" })
  },
  goTable() {
    const ids = this.data.slots.flatMap((slot) => slot.dishes.map((dish) => dish.id))
    const plate = Array.from(new Set((store.read().plate || []).concat(ids)))
    store.write({ plate })
    wx.navigateTo({ url: "/pages/shop/shop" })
  }
})

function entriesOf(value, fallback) {
  const source = Array.isArray(value) && value.length ? value : (fallback || [])
  return source.map((item) => (typeof item === "string" ? { id: item } : item)).filter((item) => item && item.id)
}

function idsOf(value, fallback) {
  return entriesOf(value, fallback).map((item) => item.id)
}

function brief(recipe) {
  if (recipe.ingredients && recipe.ingredients.length) {
    return recipe.ingredients.filter((item) => !item.seasoning).map((item) => `${item.name} ${item.grams} 克`).join("，")
  }
  return (recipe.lines || []).slice(0, 2).join("，")
}

function round(value) {
  return Math.round(value * 10) / 10
}
