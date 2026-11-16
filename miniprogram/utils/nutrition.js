/** 与 ChineseDri2023Energy、ObesityDietInitialization 同一套公开表。 */
const MALE = {
  "18-29": { 1: 9, 2: 10.67, 3: 12.55 },
  "30-49": { 1: 8.58, 2: 10.46, 3: 12.34 },
  "50-64": { 1: 8.16, 2: 10.04, 3: 11.72 },
  "65-74": { 1: 7.95, 2: 9.62 },
  "75+": { 1: 7.53, 2: 9.2 }
}

const FEMALE = {
  "18-29": { 1: 7.11, 2: 8.79, 3: 10.25 },
  "30-49": { 1: 7.11, 2: 8.58, 3: 10.04 },
  "50-64": { 1: 6.69, 2: 8.16, 3: 9.62 },
  "65-74": { 1: 6.49, 2: 7.74 },
  "75+": { 1: 6.28, 2: 7.32 }
}

function band(age) {
  if (age < 18) return null
  if (age <= 29) return "18-29"
  if (age <= 49) return "30-49"
  if (age <= 64) return "50-64"
  if (age <= 74) return "65-74"
  return "75+"
}

function requirement(sex, age, activity) {
  const table = sex === 2 ? FEMALE : MALE
  const row = table[band(age)]
  if (!row || row[activity] == null) return null
  return Math.round(row[activity] * 239)
}

function proteinFloor(sex, age) {
  if (age < 18) return null
  if (sex === 2) return age <= 64 ? 55 : 62
  return age <= 64 ? 65 : 72
}

function goal(mode) {
  if (mode === "home" || mode === "keep") return "keep"
  if (mode === "gain") return "gain"
  return "cut"
}

function bmi(heightCm, weightKg) {
  const height = Number(heightCm) / 100
  const weight = Number(weightKg)
  if (!height || !weight || height < 1 || height > 2.3 || weight < 30 || weight > 250) return null
  const value = Math.round((weight / (height * height)) * 10) / 10
  let label = "正常"
  if (value < 18.5) label = "偏瘦"
  else if (value >= 28) label = "肥胖"
  else if (value >= 24) label = "超重"
  return { value, label }
}

function suggest(profile) {
  const need = requirement(profile.sex, profile.age, profile.activity)
  if (need == null) return null
  const mode = goal(profile.mode)
  const floor = profile.sex === 2 ? 1200 : 1500
  let energy = need
  if (mode === "cut") energy = Math.max(Math.round(need * 0.85), floor)
  if (mode === "gain") energy = Math.round(need * 1.1)
  let protein = proteinFloor(profile.sex, profile.age)
  const weight = Number(profile.weight)
  if (mode === "gain" && weight >= 30 && weight <= 250) {
    protein = Math.max(protein, Math.round(weight * 1.6))
  }
  const breakfast = Math.round(energy * 0.3)
  const lunch = Math.round(energy * 0.4)
  return {
    need,
    energy,
    protein,
    fat: Math.round((energy * 0.3) / 9 * 10) / 10,
    fiber: 25,
    mode,
    bmi: bmi(profile.height, profile.weight),
    meals: { breakfast, lunch, dinner: energy - breakfast - lunch },
    limited: mode === "cut" && energy === floor && Math.round(need * 0.85) < floor
  }
}

module.exports = { suggest }
