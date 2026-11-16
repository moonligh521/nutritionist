Page({
  go(event) {
    const url = event.currentTarget.dataset.url
    if (url.indexOf("/pages/checkin/") === 0 || url.indexOf("/pages/budget/") === 0 || url.indexOf("/pages/shop/") === 0) {
      wx.navigateTo({ url })
    }
  }
})
