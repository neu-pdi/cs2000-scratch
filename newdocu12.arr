use context dcic2024

"hi"

weather-data =
  table: date, temp, precipitation
    row: "2025-01-01", 62, 0.1
    row: "2025-01-02", "45", 3
    row: "2025-01-03", 28, 0.2
    row: "2025-01-04", 55, -1
    row: "2025-01-05", 90, 0
  end

# step 1: clean the temperature column, transform column or do it manually
# step 2: binning. decide the binning ranges
# step 3: Add a column that has temperature categorized
# step 4: create bar chart



fun normalize-temp(v):
  doc: "given a number or a string that represents a number, converts to a number"
  if is-string(v): 
    string-to-number(v).or-else(0)
  else: 
    v
  end
where:
  normalize-temp(10) is 10
  normalize-temp("13") is 13
end


fixed-data = transform-column(weather-data, "temp", normalize-temp) 





fun categorized-temp(r :: Row):
  doc: "categorizes temperature into hot, cold and mild"
  if r["temp"] > 77:
    
    "hot"
    
  else if r["temp"] < 60:
    
    "cold"
    
  else: 
    
    "mild"
    
  end 
  
where: 
  categorized-temp(fixed-data.row-n(0)) is "mild"
  categorized-temp(fixed-data.row-n(1)) is "cold"
  categorized-temp(fixed-data.row-n(4)) is "hot"
        
end

    

cat-weather-data = build-column(fixed-data, "categorized temp", categorized-temp)


jonah = freq-bar-chart(cat-weather-data, "categorized temp")



fun categorized-prec(r :: Row):
  doc: "categorizes temperature into hot, cold and mild"
  if r["precipitation"] >= 1:
    
    "rain"
    
  else if (r["precipitation"] < 1) and (r["precipitation"] > 0):
    
    "drizzly"
    
  else: 
    
    "dry"
    
  end 
  
where: 
  categorized-prec(fixed-data.row-n(0)) is "drizzly"
  categorized-prec(fixed-data.row-n(1)) is "rain"
  categorized-prec(fixed-data.row-n(4)) is "dry"
        
end

bat-weather-data = build-column(fixed-data, "categorized-prec", categorized-prec)


jonah2 = freq-bar-chart(bat-weather-data, "categorized-prec")
















employees =
  table: full-name :: String, department :: String
    row: "Jordan Smith", "Sales"
    row: "Alexandra Lee", "Engineering"
    row: "Sam", "Marketing"
    row: "Ng, Alice", "Operations"
  end


# maybe i can use substring to isolate the last names but how do I decide when is enough
# Also Sam doesnt have a last name so I'd need to code something for that
