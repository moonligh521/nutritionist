const catalog = require("../data/catalog")

function addDays(date, days) {
  const next = new Date(date.getFullYear(), date.getMonth(), date.getDate() + days)
  return next
}

function dateKey(date) {
  const month = `${date.getMonth() + 1}`.padStart(2, "0")
  const day = `${date.getDate()}`.padStart(2, "0")
  return `${date.getFullYear()}-${month}-${day}`
}

function slotLine(value) {
  const items = Array.isArray(value) ? value : value ? [value] : []
  const dishes = items.map((item) => {
    if (item && item.id && item.energy != null) return item
    const id = typeof item === "string" ? item : item && item.id
    const recipe = catalog.byId(id)
    return recipe ? { id, name: recipe.name, energy: recipe.nutrition.energy } : null
  }).filter(Boolean)
  if (!dishes.length) return null
  return {
    text: dishes.map((dish) => dish.name || (catalog.byId(dish.id) && catalog.byId(dish.id).name) || dish.id).join("、"),
    kcal: dishes.reduce((sum, dish) => sum + (Number(dish.energy) || 0), 0)
  }
}

function savedRows(generated, start, days) {
  const rows = []
  for (let offset = 0; offset < days; offset += 1) {
    const date = addDays(start, offset)
    const key = dateKey(date)
    const day = (generated && generated[key]) || {}
    const breakfast = slotLine(day.breakfast)
    const lunch = slotLine(day.lunch)
    const dinner = slotLine(day.dinner)
    rows.push({
      key,
      label: `${date.getMonth() + 1}月${date.getDate()}日`,
      weekday: "日一二三四五六"[date.getDay()],
      energy: (breakfast ? breakfast.kcal : 0) + (lunch ? lunch.kcal : 0) + (dinner ? dinner.kcal : 0),
      breakfast: breakfast && breakfast.text,
      breakfastKcal: breakfast && breakfast.kcal,
      lunch: lunch && lunch.text,
      lunchKcal: lunch && lunch.kcal,
      dinner: dinner && dinner.text,
      dinnerKcal: dinner && dinner.kcal,
      planned: !!(breakfast || lunch || dinner)
    })
  }
  return rows
}

function copySolved(day) {
  return {
    breakfast: day.breakfast || [],
    lunch: day.lunch || [],
    dinner: day.dinner || []
  }
}

module.exports = { savedRows, copySolved, dateKey }
