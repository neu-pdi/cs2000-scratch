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
  sanitize prep-time using num-sanitizenr
end
  


homicide = load-table: Count-of-PPA :: Number, Borough :: String, Gender :: String, Age-Group :: String, Self-Classified-Ethnicity :: String, Offence-Type :: String, Charged-Summonsed :: String, Proceedings-Date :: String
  source: csv-table-url("https://data.london.gov.uk/download/baaaea11-6c41-4795-aa26-f2b35c8e56ea/43ef69af-f8ed-42eb-b3b5-f16cbfffc578/Homicide%20Proceeded%202003%20-%20March%202024.csv", default-options)
    
  sanitize Count-of-PPA using num-sanitizer
end



recipes.row-n(2)["prep-time"]
recipes.row-n(3)






#DAY 2 of tables

orders = table: time, amount
  row: "08:00", 10.50
  row: "09:30", 5.75
  row: "10:15", 8.00
  row: "11:00", 3.95
  row: "14:00", 4.95
  row: "16:45", 7.95
end


fun high-val(o :: Row):
  doc: "determines if row has an amount of >= 8 dollars"
  o["amount"] >= 5.0
where:
  high-val(orders.row-n(2)) is true
  high-val(orders.row-n(3)) is false
end

new-high-orders = filter-with(orders, high-val)


fun is-morn(rise :: Row):
  rise["time"] <= "12"
  
where:
  
  is-morn(orders.row-n(2)) is true 
  is-morn(orders.row-n(5)) is false
  
end
  
  
  
  
swap_order = order-by(orders, "time", false)

latestmorn = swap_order.row-n(2)["amount"]



photos = load-table: Location :: String, Subject :: String, Date :: String
  source: csv-table-url("https://pdi.run/f25-2000-photos.csv", default-options)
end


fun forest(tree :: Row):
  doc: "identifies the subject forest in the table"
  tree["Subject"] == "Forest"
  
end


forest-finder = filter-with(photos, forest)

date-order = order-by(photos, "Date", false)

latestlocation = date-order.row-n(0)["Location"]





