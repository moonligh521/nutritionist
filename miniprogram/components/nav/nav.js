Component({
  properties: {
    current: { type: String, value: "" }
  },
  data: {
    items: [
      { url: "/pages/today/today", label: "首页" },
      { url: "/pages/recipes/recipes", label: "食谱" },
      { url: "/pages/plan/plan", label: "计划" },
      { url: "/pages/mine/mine", label: "我的" }
    ]
  },
  methods: {
    go(event) {
      const url = event.currentTarget.dataset.url
      if (url === this.properties.current) return
      wx.redirectTo({ url })
    }
  }
})
