const base = "http://127.0.0.1:18091"

function foodImage(id) {
  return `/images/food/${id}.jpg`
}

function loadCatalog(catalog) {
  return new Promise((resolve) => {
    wx.request({
      url: `${base}/api/nutrition/catalog`,
      timeout: 4000,
      success(res) {
        const body = res.data || {}
        if (body.code === 200 && body.data) {
          catalog.applyRemote(body.data)
          resolve(true)
          return
        }
        resolve(false)
      },
      fail() {
        resolve(false)
      }
    })
  })
}

function planDay(profile, foodIds) {
  const foods = (foodIds || []).join(",")
  const query = `sex=${profile.sex}&age=${profile.age}&activity=${profile.activity}&mode=${profile.mode || "cut"}&foods=${foods}`
  return new Promise((resolve) => {
    wx.request({
      url: `${base}/api/nutrition/catalog/day?${query}`,
      timeout: 8000,
      success(res) {
        const body = res.data || {}
        if (body.code === 200 && body.data) {
          resolve(body.data)
          return
        }
        resolve(null)
      },
      fail() {
        resolve(null)
      }
    })
  })
}

function recommend(foodIds) {
  const foods = (foodIds || []).join(",")
  return new Promise((resolve) => {
    wx.request({
      url: `${base}/api/nutrition/catalog/matches?foods=${encodeURIComponent(foods)}`,
      timeout: 8000,
      success(res) {
        const body = res.data || {}
        resolve(body.code === 200 && body.data ? body.data : { dishes: [], unrecognized: [], fallback: "服务暂时没有返回结果，不会另外编一道。" })
      },
      fail() {
        resolve({ dishes: [], unrecognized: [], fallback: "没有连上服务，不会另外编一道。" })
      }
    })
  })
}

function turn(foods, profile) {
  return new Promise((resolve) => {
    wx.request({
      url: `${base}/api/nutrition/agent/turns`,
      method: "POST",
      data: { foods: foods || [], profile: profile || null, text: "" },
      timeout: 8000,
      success(res) {
        const body = res.data || {}
        resolve(body.code === 200 && body.data ? body.data : {
          dishes: [],
          unrecognized: [],
          fallback: "服务暂时没有返回结果，不会另外编一道。",
          day: null,
          explanation: "",
          toolCalls: []
        })
      },
      fail() {
        resolve({
          dishes: [],
          unrecognized: [],
          fallback: "没有连上服务，不会另外编一道。",
          day: null,
          explanation: "",
          toolCalls: []
        })
      }
    })
  })
}

module.exports = { base, foodImage, loadCatalog, planDay, recommend, turn }
