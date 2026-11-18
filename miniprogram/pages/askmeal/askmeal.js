const store = require("../../utils/store")
const { warmup, turn, matches, memoryFacts, analyzeNodes } = require("../../utils/api")

const PANTRY = ["番茄", "鸡蛋", "豆腐", "青椒", "土豆"]

Page({
  data: {
    sessionId: "",
    patientId: "",
    draft: "",
    busy: false,
    messages: [],
    nodes: [],
    lastRoundTitle: "尚未开始",
    scriptLog: "",
    scrollInto: "",
    msgSeq: 0,
    entered: false
  },

  onShow() {
    const app = getApp()
    let patientId = (app && app.globalData && app.globalData.patientId) || wx.getStorageSync("nutritionPatientId") || ""
    if (!patientId) {
      patientId = "mp-p-" + Date.now()
      wx.setStorageSync("nutritionPatientId", patientId)
      if (app && app.globalData) app.globalData.patientId = patientId
    }
    const sessionId = (app && app.globalData && app.globalData.sessionId) || wx.getStorageSync("nutritionSessionId") || ""
    this.setData({ sessionId, patientId })
    // 首次进入：预热 + 欢迎语（只做一次，避免切页重复）
    if (!this.data.entered) {
      this.setData({ entered: true, busy: true })
      this.greetOnEnter().then(() => this.setData({ busy: false }))
    }
  },

  greetOnEnter() {
    this.pushAssistant("你好，我是营养食材推荐助手。可以说家里有什么，我帮你从已发布菜谱里选最多 3 道能做的菜；也可以说换一个、再加个汤。")
    return this.runWarmup("进入预热").then((ok) => {
      if (!ok) {
        this.pushAssistant("偏好预热暂时没连上服务，你仍可以直接说话；连上后会带上忌口。")
      }
      return ok
    })
  },

  onDraft(e) {
    this.setData({ draft: e.detail.value || "" })
  },

  onClear() {
    this.setData({
      messages: [],
      nodes: [],
      lastRoundTitle: "已清空",
      scriptLog: "",
      draft: ""
    })
    this.pushAssistant("你好，我是营养食材推荐助手。可以说家里有什么，我帮你选菜。")
  },

  onWarmup() {
    if (this.data.busy) return
    this.setData({ busy: true })
    this.runWarmup("手动预热").then(() => this.setData({ busy: false }))
  },

  onSend() {
    if (this.data.busy) return
    const text = (this.data.draft || "").trim()
    if (!text) {
      wx.showToast({ title: "先说一句", icon: "none" })
      return
    }
    // 从原话拆食材名，一并交给真实 turns（避免只丢 text、模型误判域外）
    const foods = extractFoods(text)
    this.setData({ draft: "", busy: true })
    this.runTurn("手动对话", text, foods).then(() => this.setData({ busy: false }))
  },

  onRunScript() {
    if (this.data.busy) return
    this.setData({ busy: true, scriptLog: "开始完整验收…\n", messages: [], nodes: [] })
    this.runFullScript()
      .catch((err) => {
        this.appendLog("脚本中断: " + (err && err.message ? err.message : err))
      })
      .then(() => this.setData({ busy: false }))
  },

  runFullScript() {
    const foods = PANTRY
    return this.runWarmup("R0 打开问餐")
      .then((ok) => {
        if (!ok) throw new Error("WARMUP 失败，已停止")
        return this.runTurn("R1 问候", "你好", [])
      })
      .then((ok) => {
        if (!ok) throw new Error("R1 失败，已停止")
        return this.runTurn("R2 荐菜", "想吃川菜，家里有番茄鸡蛋豆腐", foods)
      })
      .then((ok) => {
        if (!ok) throw new Error("R2 失败，已停止")
        return this.runTurn("R3 绝对忌口", "我绝对不能吃香菜", [])
      })
      .then((ok) => {
        if (!ok) throw new Error("R3 失败，已停止")
        return this.runTurn("R4 再荐菜", "番茄鸡蛋豆腐推荐几道", foods)
      })
      .then((ok) => {
        if (!ok) throw new Error("R4 失败，已停止")
        return this.runTurn("R5 换一个", "换一个", [])
      })
      .then((ok) => {
        if (!ok) throw new Error("R5 失败，已停止")
        return this.runTurn("R6 再加个汤", "再加个汤", [])
      })
      .then((ok) => {
        if (!ok) throw new Error("R6 失败，已停止")
        return this.runMatchesProbe("R7 点名不存在菜系")
      })
      .then((ok) => {
        if (!ok) throw new Error("R7 失败，已停止")
        return this.runTurn("R8 改口", "可以吃香菜了", [])
      })
      .then((ok) => {
        if (!ok) throw new Error("R8 失败，已停止")
        return this.runTurn("R9 记忆问答", "我现在不喜欢什么", [])
      })
      .then((ok) => {
        if (!ok) throw new Error("R9 失败，已停止")
        return this.runTurn("R10 无食材引导", "帮我推荐", [])
      })
      .then(() => {
        return memoryFacts(this.data.patientId).then((facts) => {
          this.appendLog("facts 核对: " + (facts ? JSON.stringify(facts).slice(0, 180) : "空"))
          this.appendLog("完整验收脚本结束")
        })
      })
  },

  runWarmup(title) {
    const started = Date.now()
    return warmup({
      sessionId: this.data.sessionId,
      patientId: this.data.patientId
    }).then((res) => {
      const ok = !!res.ok
      const epoch = res.data && res.data.preferenceEpoch != null ? res.data.preferenceEpoch : "?"
      const phase = res.data && res.data.phase ? res.data.phase : "?"
      const nodes = analyzeNodes({
        kind: "warmup",
        warmupOk: ok,
        warmupDetail: ok
          ? `epoch=${epoch} phase=${phase} ms=${Date.now() - started}`
          : (res.message || "fail")
      })
      this.setData({
        nodes,
        lastRoundTitle: title,
        sessionId: (res.data && res.data.sessionId) || this.data.sessionId
      })
      this.appendLog(`${title}: ${ok ? "PASS" : "FAIL"} epoch=${epoch}`)
      this.pushAssistant(ok
        ? `偏好已预热（epoch=${epoch}，phase=${phase}）`
        : `预热失败：${res.message || "未知错误"}`)
      return ok
    })
  },

  runTurn(title, text, foods) {
    this.pushUser(text)
    const saved = store.read()
    const expect = roundExpect(title)
    return turn({
      sessionId: this.data.sessionId,
      patientId: this.data.patientId,
      text,
      foods: foods || [],
      profile: saved.profile || null
    }).then((pack) => {
      const reply = pack.reply || {}
      const nodes = analyzeNodes({
        reply,
        sseEvents: pack.sseEvents,
        ms: pack.ms,
        errorEvent: pack.errorEvent,
        expect
      })
      const bizFail = !businessPass(title, reply)
      const criticalFail = nodes.some((n) => n.critical && !n.pass) || bizFail
      const dishText = (reply.dishes || []).map((d) => d.name || d).filter(Boolean).join("、")
      const assistantText = [
        reply.explanation || "",
        reply.memoryAnswer || "",
        reply.fallback || "",
        reply.rememberedHint || ""
      ].filter(Boolean).join("\n") || (dishText ? "已给出推荐。" : "本轮无文案。")

      this.pushAssistant(assistantText, dishText)
      this.setData({
        nodes,
        lastRoundTitle: title,
        sessionId: reply.sessionId || this.data.sessionId
      })
      this.appendLog(
        `${title}: ${criticalFail ? "FAIL" : "PASS"} plan=${(reply.plan || []).join(",") || "∅"} dishes=${(reply.dishes || []).length} empty=${reply.emptyReason || "∅"} epoch=${reply.preferenceEpoch || 0} ms=${pack.ms}${bizFail ? " biz=FAIL" : ""}`
      )
      return !criticalFail
    })
  },

  runMatchesProbe(title) {
    return matches({
      foods: ["番茄", "鸡蛋"],
      cuisine: "XYZ",
      text: "不存在的菜系XYZ"
    }).then((data) => {
      const dishes = (data && data.dishes) || []
      const reason = (data && (data.emptyReason || data.fallback)) || ""
      const pass = dishes.length === 0 && String(reason).indexOf("FALLBACK_ALL_PUBLISHED") < 0
      const nodes = [{
        id: "RECALL_EXECUTE",
        pass,
        detail: `matches cuisine=XYZ dishes=${dishes.length} reason=${reason || "∅"}`,
        critical: true
      }, {
        id: "SSE_ENVELOPE",
        pass: true,
        detail: "本轮走 catalog/matches 探针，非 turns",
        critical: false
      }]
      this.setData({ nodes, lastRoundTitle: title })
      this.pushAssistant(pass
        ? `点名 XYZ 已 fail-closed（dishes=0，reason=${reason || "空"}）`
        : `点名 XYZ 未按预期关闭：dishes=${dishes.length} reason=${reason}`)
      this.appendLog(`${title}: ${pass ? "PASS" : "FAIL"} dishes=${dishes.length} reason=${reason}`)
      return pass
    })
  },

  pushUser(text) {
    const id = this.data.msgSeq + 1
    const messages = this.data.messages.concat([{ id, role: "user", text }])
    this.setData({ messages, msgSeq: id, scrollInto: "m" + id })
  },

  pushAssistant(text, dishes) {
    const id = this.data.msgSeq + 1
    const messages = this.data.messages.concat([{ id, role: "assistant", text, dishes: dishes || "" }])
    this.setData({ messages, msgSeq: id, scrollInto: "m" + id })
  },

  appendLog(line) {
    const scriptLog = (this.data.scriptLog || "") + line + "\n"
    console.log("[E2E]", line)
    this.setData({ scriptLog })
    try {
      wx.setStorageSync("e2e_askmeal_log", scriptLog)
    } catch (e) { /* ignore */ }
  }
})

/** 验收轮次业务期望：避免节点假绿。 */
function roundExpect(title) {
  const t = title || ""
  if (t.indexOf("R2") === 0 || t.indexOf("R4") === 0) return { requireDishes: true }
  if (t.indexOf("R3") === 0) return { requireApplied: true }
  if (t.indexOf("R5") === 0 || t.indexOf("R6") === 0) return { requireDishes: true }
  if (t.indexOf("R8") === 0) return { requireApplied: true }
  if (t.indexOf("R9") === 0) return { requireMemoryAnswer: true }
  if (t.indexOf("R10") === 0) return { requireGuide: true }
  return {}
}

function businessPass(title, reply) {
  const r = reply || {}
  const plan = r.plan || []
  const dishes = r.dishes || []
  const applied = r.appliedEvents || []
  const t = title || ""
  if (t.indexOf("R2") === 0 || t.indexOf("R4") === 0) return dishes.length >= 1
  if (t.indexOf("R3") === 0) {
    return applied.length >= 1 && (r.preferenceEpoch || 0) >= 1 && plan.indexOf("OUT_OF_SCOPE") < 0
  }
  if (t.indexOf("R5") === 0 || t.indexOf("R6") === 0) {
    return dishes.length >= 1 || plan.indexOf("CLARIFY") >= 0
  }
  if (t.indexOf("R8") === 0) {
    const retracted = applied.some((e) => e && (e.op === "RETRACT" || e.op === "retract"))
    return retracted || String(r.rememberedHint || "").indexOf("撤销") >= 0 || (r.preferenceEpoch || 0) >= 1
  }
  if (t.indexOf("R9") === 0) {
    return !!r.memoryAnswer && plan.indexOf("OUT_OF_SCOPE") < 0
  }
  if (t.indexOf("R10") === 0) {
    const guides = r.guideActions || []
    return guides.indexOf("ADD_FOODS") >= 0 || r.phase === "EMPTY_GUIDE"
  }
  return true
}

/** 粗拆「我有A、B、C帮推荐」里的食材，供 foods 字段走真实归一。 */
function extractFoods(text) {
  const raw = (text || "").trim()
  if (!raw) return []
  let body = raw
    .replace(/^我(家里)?(还有|有)/, "")
    .replace(/(帮我)?(推荐|做|来)(一下|几道|点)?(菜)?。?$/, "")
    .replace(/帮推荐.*/, "")
  const parts = body.split(/[、，,/\s]+/).map((s) => s.trim()).filter((s) => s.length >= 2 && s.length <= 8)
  return parts.slice(0, 12)
}
