const catalog = require("./data/catalog")
const { loadCatalog } = require("./utils/api")

function ensureSessionId() {
  let sessionId = wx.getStorageSync("nutritionSessionId")
  if (!sessionId) {
    sessionId = "mp-" + Date.now() + "-" + Math.floor(Math.random() * 100000)
    wx.setStorageSync("nutritionSessionId", sessionId)
  }
  return sessionId
}

App({
  globalData: {
    notice: "这是建议，不是诊疗，也不能替代医生或营养师。",
    sessionId: "",
    patientId: ""
  },
  onLaunch() {
    this.globalData.sessionId = ensureSessionId()
    let patientId = wx.getStorageSync("nutritionPatientId") || ""
    if (!patientId) {
      patientId = "mp-p-" + Date.now()
      wx.setStorageSync("nutritionPatientId", patientId)
    }
    this.globalData.patientId = patientId
    // 目录走真实 /api/nutrition/catalog
    loadCatalog(catalog).then((ok) => {
      const page = getCurrentPages().slice(-1)[0]
      if (!ok || !page || !page.onShow) return
      page.onShow()
    })
  }
})
