const store = require("../../utils/store")
const { suggest } = require("../../utils/nutrition")

Page({
  data: {
    sexes: ["男", "女"],
    activities: ["轻", "中", "高"],
    sexIndex: 0,
    activityIndex: 1,
    age: "30",
    height: "",
    weight: "",
    mode: "cut",
    result: null
  },
  onShow() {
    const profile = store.read().profile
    if (!profile) {
      this.refresh()
      return
    }
    const mode = profile.mode === "home" || profile.mode === "keep" ? "keep" : profile.mode === "gain" ? "gain" : "cut"
    this.setData({
      sexIndex: profile.sex === 2 ? 1 : 0,
      activityIndex: profile.activity - 1,
      age: String(profile.age || "30"),
      height: profile.height ? String(profile.height) : "",
      weight: profile.weight ? String(profile.weight) : "",
      mode
    })
    this.refresh()
  },
  onSex(event) {
    this.setData({ sexIndex: Number(event.detail.value) })
    this.refresh()
  },
  onAge(event) {
    this.setData({ age: event.detail.value })
    this.refresh()
  },
  onHeight(event) {
    this.setData({ height: event.detail.value })
    this.refresh()
  },
  onWeight(event) {
    this.setData({ weight: event.detail.value })
    this.refresh()
  },
  onActivity(event) {
    this.setData({ activityIndex: Number(event.detail.value) })
    this.refresh()
  },
  onMode(event) {
    this.setData({ mode: event.currentTarget.dataset.mode })
    this.refresh()
  },
  profile() {
    return {
      sex: this.data.sexIndex === 1 ? 2 : 1,
      age: Number(this.data.age),
      activity: this.data.activityIndex + 1,
      height: this.data.height,
      weight: this.data.weight,
      mode: this.data.mode
    }
  },
  refresh() {
    this.setData({ result: suggest(this.profile()) })
  },
  save() {
    if (!this.data.result) {
      wx.showToast({ title: "这个年龄或活动量不估算", icon: "none" })
      return
    }
    store.write({ profile: this.profile() })
    wx.showToast({ title: "已记下", icon: "none" })
  }
})
