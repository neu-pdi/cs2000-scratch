use context dcic2024
  items = table: item :: String, x-coordinate :: Number, y-coordinate :: Number
    row: "Sword of Dawn",           23,  -87
    row: "Healing Potion",         -45,   12
    row: "Dragon Shield",           78,  -56
    row: "Magic Staff",             -9,   64
    row: "Elixir of Strength",      51,  -33
    row: "Cloak of Invisibility",  -66,    5
    row: "Ring of Fire",            38,  -92
    row: "Boots of Swiftness",     -17,   49
    row: "Amulet of Protection",    82,  -74
    row: "Orb of Wisdom",          -29,  -21
  end

fun calc-distance(r :: Row) -> Number:
  doc: "does distance to origin from fields 'x-coordinate' and 'y-coordinate'"
  num-sqrt(num-sqr(r["x-coordinate"]) + num-sqr(r["y-coordinate"]))
where:
  calc-distance(items.row-n(0)) is-roughly num-sqrt(num-sqr(23) + num-sqr(-87))
  calc-distance(items.row-n(3)) is-roughly num-sqrt(num-sqr(-9) + num-sqr(64))
end

items-with-dist = build-column(items, "distance", calc-distance)

fun subtract-1(n :: Number) -> Number:
  doc: "subtracts 1 from input"
  n - 1
where:
  subtract-1(10) is 9
  subtract-1(0) is -1
  subtract-1(-3.5) is -4.5
end

moved-items = transform-column(items, "x-coordinate", subtract-1)



fun tenpercentsmaller(coods :: Number):
  doc: "makes numbers ten % smaller"
  
  num-to-rational(coods) * 0.9
  
where: 
  tenpercentsmaller(1) is 0.9
  
end


jesus = transform-column(transform-column(items, "y-coordinate", tenpercentsmaller), "x-coordinate", tenpercentsmaller)


fun calcu-distance(r :: Row) -> Number:
  doc: "does distance to origin from fields 'x-coordinate' and 'y-coordinate'"
  num-sqrt(num-sqr(r["x-coordinate"]) + num-sqr(r["y-coordinate"]))
where:
  calcu-distance(jesus.row-n(0)) is-roughly num-sqrt(num-sqr(20.7) + num-sqr(-78.3))
end


fun nummynumnum(b :: Number):
  doc: "makes the numbers in the table rational"
  
  num-to-rational(b) 
 
end



chaloo = build-column(jesus, "distancio", calcu-distance)

je_sus = transform-column(chaloo, "distancio", nummynumnum)


nazareth = order-by(je_sus, "distancio", true)


obfuscatin = transform-column(nazareth, "item", lam(name :: String): string-repeat("x", (lam(r :: Row): string-length(r["item"]) end)) end)   





fun hduwh(bean :: Number):
  
  if bean >= 50:
    
"yo bean??"
    
  else if bean == 32:
      
      "beanie thirtytwo???"
      
      else: 
      
      "beantastic"
      
    end
  end
    







    
fun apply-discounts(t :: Table) -> Table:
  doc: "transforms 'price' column by reducing 20%, if value is below 100"
  transform-column(t, "price", lam(price :: Number): 
    if price < 100: price * 0.8 else: price end
  end)
where:
  test-table =
    table: price
      row: 50
      row: 120
      row: 80
      row: 40
    end
  apply-discounts(test-table) is
  table: price
    row: 50 * 0.8
    row: 120
    row: 80 * 0.8
    row: 40 * 0.8
  end
end


#DAY10

prices = table: Price
  
      row: 50
      row: 120
  row: 80
      row: 40
      row: 50
  row: 80
  row: 80
    end



maxitaxi = build-column(prices, "tax", lam(r :: Row): r["Price"] * 1.0625 end)

