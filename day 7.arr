use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")
include csv

recipes-raw = load-table:
  title :: String,
  servings :: Number,
  prep-time :: Number
  source: csv-table-url("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/support/5-recipes.csv", default-options)
end

recipes-with-servings = transform-column(recipes-raw, "servings", string-to-number-default(0))
recipes = transform-column(recipes-with-servings, "prep-time", string-to-number-default(0))
  


workouts = table: date :: String, activity :: String, duration :: Number, had-protein :: Boolean
  row: "Sep 21", "run", 30, true
  row: "Sep 22", "gym", 45, false
  row: "Sep 23", "bike", 25, true
end




google-activity = load-table:
  num :: Number,
  date :: String,
  area-name :: String,
  area-code :: String,
  retail-rec :: Number,
  grocery-pharm :: Number,
  parks :: Number,
  transit-stations :: Number,
  workplaces :: Number,
  residential :: Number
  
  source: csv-table-url("https://data.london.gov.uk/download/vqzm4/01dcf23c-e18e-401f-ac1a-384b26f36375/google_activity_by_London_Borough.csv", default-options)
end

