use context dcic2024





fun check-age(age :: Number):
doc: "takes an age and returns true if it's equal or above 21"

if age >= 21:
true

  else: false

end
where:
check-age(20) is false
check-age(21) is true
check-age(22) is true

end














fun find-drought-risks(t :: Table):
doc: "takes a table and returns a new table that contains only regions where rainfall amounts decreased from 2023-2024"

  fun lower-rainfall-region-finder(r :: Row): 

    if (r["rainfall-2024"] - r["rainfall-2023"]) < 0:
      true

    else: false
    
    end 
  end
  
      filter-with(t, lower-rainfall-region-finder)

where: 

  RainfallRegions = table: region, rainfall-2024, rainfall-2023
    row:  "Scotland", 6, 5
    row:  "Western England", 7, 8
    row:  "Plymouth", 10, 20
  end
    results  = table: region, rainfall-2024, rainfall-2023
    row: "Western England", 7, 8
    row: "Plymouth", 10, 20
  end


      find-drought-risks(RainfallRegions) is results

end
