const catalog = require("./data/catalog")
const { loadCatalog } = require("./utils/api")

App({
  globalData: {
    notice: "这是建议，不是诊疗，也不能替代医生或营养师。"
  },
  onLaunch() {
    loadCatalog(catalog).then((ok) => {
      const page = getCurrentPages().slice(-1)[0]
      if (!ok || !page || !page.onShow) return
      page.onShow()
    })
  }
})
