/** develop 默认本机；trial/release 可读 storage 覆盖。正式环境须换成微信合法 HTTPS 域名。 */
const DEFAULT_DEV_BASE = "http://127.0.0.1:18091"

function resolveBase() {
  try {
    const override = wx.getStorageSync("nutritionApiBase")
    if (override && typeof override === "string" && override.trim()) {
      return override.replace(/\/$/, "")
    }
  } catch (e) { /* ignore */ }
  let env = "develop"
  try {
    env = wx.getAccountInfoSync().miniProgram.envVersion || "develop"
  } catch (e) { /* ignore */ }
  // trial/release 未配置 storage 时仍回落本地，便于工具内验；真机发版前请 setStorage nutritionApiBase。
  if (env === "trial" || env === "release") {
    return DEFAULT_DEV_BASE
  }
  return DEFAULT_DEV_BASE
}

const base = resolveBase()

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

function matches(options) {
  const opts = options || {}
  const parts = []
  ;(opts.foods || []).forEach((food) => {
    if (food) parts.push(`foods=${encodeURIComponent(food)}`)
  })
  if (opts.cuisine) parts.push(`cuisine=${encodeURIComponent(opts.cuisine)}`)
  if (opts.kind) parts.push(`kind=${encodeURIComponent(opts.kind)}`)
  if (opts.text) parts.push(`text=${encodeURIComponent(opts.text)}`)
  if (opts.conditions) {
    opts.conditions.forEach((c) => {
      if (c) parts.push(`conditions=${encodeURIComponent(c)}`)
    })
  }
  return new Promise((resolve) => {
    wx.request({
      url: `${base}/api/nutrition/catalog/matches?${parts.join("&")}`,
      timeout: 15000,
      success(res) {
        const body = res.data || {}
        resolve(body.code === 200 && body.data ? body.data : { dishes: [], emptyReason: "CLIENT", fallback: "" })
      },
      fail() {
        resolve({ dishes: [], emptyReason: "CLIENT_FAIL", fallback: "" })
      }
    })
  })
}

function warmup(options) {
  const app = getApp()
  const opts = options || {}
  const sessionId = opts.sessionId || (app && app.globalData && app.globalData.sessionId) || ""
  const patientId = opts.patientId || (app && app.globalData && app.globalData.patientId) || ""
  return new Promise((resolve) => {
    wx.request({
      url: `${base}/api/nutrition/agent/sessions/${encodeURIComponent(sessionId)}/preference/warmup`,
      method: "POST",
      data: { patientId: patientId || null },
      timeout: 10000,
      success(res) {
        const body = res.data || {}
        if (body.code === 200 && body.data) {
          resolve({ ok: true, data: body.data, raw: body })
          return
        }
        resolve({ ok: false, data: null, message: body.message || "warmup 失败", raw: body })
      },
      fail(err) {
        resolve({ ok: false, data: null, message: (err && err.errMsg) || "warmup 连不上服务", raw: null })
      }
    })
  })
}

function memoryFacts(ownerId) {
  return new Promise((resolve) => {
    wx.request({
      url: `${base}/api/nutrition/memory/facts?ownerId=${encodeURIComponent(ownerId || "")}`,
      timeout: 8000,
      success(res) {
        const body = res.data || {}
        resolve(body.code === 200 ? body.data : null)
      },
      fail() {
        resolve(null)
      }
    })
  })
}

function retract(options) {
  const opts = options || {}
  return new Promise((resolve) => {
    wx.request({
      url: `${base}/api/nutrition/memory/retract`,
      method: "POST",
      data: {
        ownerId: opts.ownerId,
        subject: opts.subject,
        note: opts.note || "小程序改口",
        sessionId: opts.sessionId || ""
      },
      timeout: 8000,
      success(res) {
        const body = res.data || {}
        resolve(body.code === 200 ? body.data : null)
      },
      fail() {
        resolve(null)
      }
    })
  })
}

/**
 * 对话回合：SSE（event=reply / done / error）。
 * 返回 { reply, sseEvents, ms, errorEvent }
 */
function turn(options) {
  const app = getApp()
  const opts = options || {}
  const sessionId = opts.sessionId || (app && app.globalData && app.globalData.sessionId) || ""
  const patientId = opts.patientId || (app && app.globalData && app.globalData.patientId) || ""
  const payload = {
    sessionId,
    patientId: patientId || null,
    foods: opts.foods || [],
    profile: opts.profile || null,
    text: opts.text || "",
    conditions: opts.conditions || [],
    allergens: opts.allergens || [],
    avoidFoods: opts.avoidFoods || [],
    preferTags: opts.preferTags || [],
    preferCuisines: opts.preferCuisines || [],
    confirmations: opts.confirmations || []
  }
  const empty = (fallback) => ({
    sessionId,
    dishes: [],
    unrecognized: [],
    fallback,
    day: null,
    explanation: "",
    memoryAnswer: "",
    dishSlots: [],
    allergySuspects: [],
    toolCalls: [],
    plan: [],
    phase: "",
    emptyReason: "",
    guideActions: [],
    degradeStep: 0,
    rememberedHint: "",
    preferenceEpoch: 0,
    revision: 0,
    appliedEvents: []
  })
  const started = Date.now()
  return new Promise((resolve) => {
    wx.request({
      url: `${base}/api/nutrition/agent/turns`,
      method: "POST",
      data: payload,
      header: { Accept: "text/event-stream" },
      responseType: "text",
      timeout: 120000,
      success(res) {
        const parsed = parseSseStream(res.data)
        const reply = parsed.reply || empty(parsed.errorMessage || "服务暂时没有返回结果，不会另外编一道。")
        if (reply.sessionId) {
          if (app && app.globalData) app.globalData.sessionId = reply.sessionId
          wx.setStorageSync("nutritionSessionId", reply.sessionId)
        }
        resolve({
          reply,
          sseEvents: parsed.events,
          ms: Date.now() - started,
          errorEvent: parsed.errorMessage || ""
        })
      },
      fail(err) {
        resolve({
          reply: empty((err && err.errMsg) || "没有连上服务，不会另外编一道。"),
          sseEvents: [],
          ms: Date.now() - started,
          errorEvent: "CLIENT_FAIL"
        })
      }
    })
  })
}

function parseSseReply(raw) {
  return (parseSseStream(raw).reply) || null
}

function parseSseStream(raw) {
  const out = { reply: null, events: [], errorMessage: "" }
  if (!raw) return out
  if (typeof raw === "object" && raw.sessionId) {
    out.reply = raw
    out.events = ["reply"]
    return out
  }
  const text = typeof raw === "string" ? raw : ""
  let event = ""
  let data = ""
  const lines = text.split(/\r?\n/)
  const flush = () => {
    if (!event && !data) return
    out.events.push(event || "message")
    if (event === "reply" && data) {
      try { out.reply = JSON.parse(data) } catch (e) { out.errorMessage = "reply JSON 解析失败" }
    }
    if (event === "error" && data) {
      try {
        const err = JSON.parse(data)
        out.errorMessage = err.message || data
      } catch (e) {
        out.errorMessage = data
      }
    }
    event = ""
    data = ""
  }
  for (let i = 0; i < lines.length; i++) {
    const line = lines[i]
    if (line.startsWith("event:")) {
      event = line.slice(6).trim()
    } else if (line.startsWith("data:")) {
      data = data ? data + "\n" + line.slice(5).trim() : line.slice(5).trim()
    } else if (line === "") {
      flush()
    }
  }
  flush()
  return out
}

/** 根据一轮结果生成节点分析（小程序侧指令表）。 */
function analyzeNodes(ctx) {
  const c = ctx || {}
  const reply = c.reply || {}
  const plan = reply.plan || []
  const dishes = reply.dishes || []
  const nodes = []
  const push = (id, pass, detail, critical) => {
    nodes.push({ id, pass: !!pass, detail: detail || "", critical: !!critical })
  }

  if (c.kind === "warmup") {
    push("WARMUP", !!c.warmupOk, c.warmupDetail || "", true)
    return nodes
  }

  push("SSE_ENVELOPE",
    (c.sseEvents || []).indexOf("reply") >= 0 && !c.errorEvent,
    `events=${(c.sseEvents || []).join(",")} ms=${c.ms || 0}${c.errorEvent ? " err=" + c.errorEvent : ""}`,
    true)

  const planOk = plan.length > 0 || !!reply.explanation || dishes.length > 0 || !!reply.fallback
  push("UNDERSTAND_PLAN", planOk,
    `plan=${plan.join(",") || "∅"} phase=${reply.phase || "∅"}`,
    true)

  const applied = (reply.appliedEvents || []).map((e) => e.subject || "").filter(Boolean)
  const expect = c.expect || {}
  const rulesOk = expect.requireApplied
    ? applied.length > 0 && (reply.preferenceEpoch || 0) >= 1
    : expect.requireMemoryAnswer
      ? !!(reply.memoryAnswer)
      : true
  push("RULES_MEMORY", rulesOk,
    `applied=[${applied.join(",")}] epoch=${reply.preferenceEpoch || 0} hint=${reply.rememberedHint || "∅"} mem=${reply.memoryAnswer ? "Y" : "∅"}`,
    !!(expect.requireApplied || expect.requireMemoryAnswer))

  const noRecallNeeded = plan.indexOf("GREETING") >= 0
    || plan.indexOf("CLARIFY") >= 0
    || plan.indexOf("CONFIRM_FOODS") >= 0
    || (!!reply.memoryAnswer && plan.indexOf("OUT_OF_SCOPE") < 0 && dishes.length === 0 && !expect.requireDishes)
  const recallOk = expect.requireDishes
    ? dishes.length > 0
    : expect.requireGuide
      ? ((reply.guideActions || []).length > 0 || reply.phase === "EMPTY_GUIDE")
      : (dishes.length > 0 || !!reply.fallback || !!reply.emptyReason || plan.indexOf("REPLACE_ONE") >= 0 || plan.indexOf("ADD_KIND") >= 0 || plan.indexOf("RECOMMEND") >= 0 || noRecallNeeded)
  push("RECALL_EXECUTE", recallOk,
    `dishes=${dishes.length} empty=${reply.emptyReason || "∅"} degrade=${reply.degradeStep || 0} guide=${(reply.guideActions || []).join(",") || "∅"}`,
    !!(expect.requireDishes || expect.requireGuide || !noRecallNeeded))

  push("SESSION", !!reply.sessionId,
    `session=${reply.sessionId || "∅"} rev=${reply.revision || 0} slots=${(reply.dishSlots || []).length}`,
    true)

  push("ASYNC_SIDE", !c.errorEvent || c.errorEvent === "",
    "旁路异步不阻断本轮",
    false)

  return nodes
}

module.exports = {
  base,
  foodImage,
  loadCatalog,
  planDay,
  recommend,
  matches,
  warmup,
  memoryFacts,
  retract,
  turn,
  parseSseReply,
  analyzeNodes
}
