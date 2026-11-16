const catalog = require("../../data/catalog")
const store = require("../../utils/store")

Page({
  data: { recipe: null },
  onLoad(query) {
    const recipe = catalog.byId(query.id)
    if (recipe) {
      recipe.lines = recipe.lines || []
      recipe.steps = recipe.steps || []
    }
    this.setData({ recipe })
  },
  add() {
    const saved = store.read()
    const shop = Array.from(new Set((saved.shop || []).concat(this.data.recipe.id)))
    store.write({ shop })
    wx.showToast({ title: "已放入采购", icon: "none" })
  }
})
