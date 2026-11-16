const KEY = "shian"

function read() {
  return wx.getStorageSync(KEY) || {}
}

function write(patch) {
  const next = Object.assign({}, read(), patch)
  wx.setStorageSync(KEY, next)
  return next
}

function todayKey() {
  return dateKey(new Date())
}

function dateKey(date) {
  const month = `${date.getMonth() + 1}`.padStart(2, "0")
  const day = `${date.getDate()}`.padStart(2, "0")
  return `${date.getFullYear()}-${month}-${day}`
}

module.exports = { read, write, todayKey, dateKey }
