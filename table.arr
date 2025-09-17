use context dcic2024

include csv
include data-source

workouts = table: date :: String, workout :: String, duration :: Number, had-protein :: Boolean
  row: "Sep 15th", "Gym", 60, true
  row: "Sep 17th", "Gym", 81, true
  row: "Sep 20th", "Running", 60, true
  row: "Sep 22nd", "Dance", 92, true
  row: "Sep 30th", "Gym", 40, true
end




recipes = load-table: title :: String, servings :: Number, prep-time :: Number
  source: csv-table-url("https://pdi.run/f25-2000-recipes.csv", default-options)
    
  sanitize servings using num-sanitizer
  sanitize prep-time using num-sanitizer
end
  


homicide = load-table: Count-of-PPA :: Number, Borough :: String, Gender :: String, Age-Group :: String, Self-Classified-Ethnicity :: String, Offence-Type :: String, Charged-Summonsed :: String, Proceedings-Date :: String
  source: csv-table-url("https://data.london.gov.uk/download/baaaea11-6c41-4795-aa26-f2b35c8e56ea/43ef69af-f8ed-42eb-b3b5-f16cbfffc578/Homicide%20Proceeded%202003%20-%20March%202024.csv", default-options)
    
  sanitize Count-of-PPA using num-sanitizer
end









recipes.row-n(2)["prep-time"]
recipes.row-n(3)
