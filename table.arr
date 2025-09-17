use context dcic2024

include csv

workouts = table: date :: String, workout :: String, duration :: Number, had-protein :: Boolean
  row: "Sep 15th", "Gym", 60, true
  row: "Sep 17th", "Gym", 81, true
  row: "Sep 20th", "Running", 60, true
  row: "Sep 22nd", "Dance", 92, true
  row: "Sep 30th", "Gym", 40, true
end




recipes = load-table: title :: String, Servings :: Number, prep-time :: Number
  source: csv-table-url("https://pdi.run/f25-2000-recipes.csv", default-options)
end
  