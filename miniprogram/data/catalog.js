/** 菜谱和食材只来自营养服务的数据库。这里不存放一份本地菜谱。 */
const recipes = []
const foods = {}
const seasoningIds = []

function applyRemote(data) {
  Object.keys(foods).forEach((id) => delete foods[id])
  seasoningIds.splice(0, seasoningIds.length)
  ;(data.foods || []).forEach((food) => {
    foods[food.id] = { name: food.name, image: food.image, seasoning: !!food.seasoning }
    if (food.seasoning) seasoningIds.push(food.id)
  })
  recipes.splice(0, recipes.length)
  ;(data.recipes || []).forEach((recipe) => {
    recipes.push({
      id: recipe.id,
      name: recipe.name,
      category: recipe.category || "weight",
      meals: ["breakfast", "lunch", "dinner"],
      cuisine: recipe.cuisine || "",
      method: recipe.method || "",
      taste: recipe.taste || "",
      cookware: recipe.cookware || "",
      step: recipe.step || "",
      steps: recipe.step ? [recipe.step] : [],
      lines: [],
      cover: "",
      ingredients: (recipe.ingredients || []).map((item) => ({
        foodId: item.foodId,
        name: item.name,
        grams: Number(item.grams),
        phrase: "",
        seasoning: seasoningIds.indexOf(item.foodId) >= 0,
        image: item.image
      })),
      nutrition: {
        energy: numberOrNull(recipe.nutrition && recipe.nutrition.energy),
        protein: numberOrNull(recipe.nutrition && recipe.nutrition.protein),
        carb: numberOrNull(recipe.nutrition && recipe.nutrition.carb),
        fat: numberOrNull(recipe.nutrition && recipe.nutrition.fat),
        fiber: recipe.nutrition && recipe.nutrition.fiber != null ? Number(recipe.nutrition.fiber) : null,
        sodium: numberOrNull(recipe.nutrition && recipe.nutrition.sodium)
      }
    })
  })
}

function numberOrNull(value) {
  return value == null || value === "" ? null : Number(value)
}

function byId(id) {
  return recipes.find((recipe) => recipe.id === id)
}

function list(category) {
  return recipes.filter((recipe) => recipe.category === category)
}

function pantryFoods() {
  return Object.keys(foods)
    .filter((id) => !foods[id].seasoning)
    .map((id) => ({ id, name: foods[id].name, image: foods[id].image }))
}

module.exports = { foods, recipes, seasoningIds, byId, list, pantryFoods, applyRemote }
