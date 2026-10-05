use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

weather-data =
  table: date, temperature, precipitation
    row: "2025-01-01", 62, 0.1
    row: "2025-01-02", "45", 3
    row: "2025-01-03", 28, 0.2
    row: "2025-01-04", 55, 0
    row: "2025-01-05", 90, 0
  end

fun normalize-temp(v) -> Number:
  doc: "given a number or a string that represents a number, converts to a number"
  if is-string(v): 
    string-to-number-unsafe(v)
  else: 
    v
  end
where:
  normalize-temp(10) is 10
  normalize-temp("13") is 13
end

fixed-data = transform-column(weather-data, "temperature", normalize-temp)

fun bucket-temp(t :: Number) -> String:
  doc: "numbers < 40 turn into 'cold', >=40 and < 60 to 'mild' and >=60 to 'hot'"
  if t < 40:
    "cold"
  else if t < 60:
    "mild"
  else:
    "hot"
  end
where:
  bucket-temp(-10) is "cold"
  bucket-temp(0) is "cold"
  bucket-temp(39.9) is "cold"
  bucket-temp(40) is "mild"
  bucket-temp(58) is "mild"
  bucket-temp(60) is "hot"
  bucket-temp(100) is "hot"
end

with-buckets = build-column(fixed-data, "temp-category", lam(r :: Row) -> String: bucket-temp(get-column(r, "temperature")) end)

#freq-bar-chart(with-buckets, "temp-category")

fun bucket-prec(p :: Number) -> String:
  doc: "numbers >= 1 turn into 'wet', < 1 and > 0 to 'drizzly' and 0 to 'dry'"
  if p >= 1:
    "wet"
  else if p > 0:
    "drizzly"
  else:
    "dry"
  end
where:
  bucket-prec(0) is "dry"
  bucket-prec(0.1) is "drizzly"
  bucket-prec(0.9) is "drizzly"
  bucket-prec(1) is "wet"
  bucket-prec(1.1) is "wet"
  bucket-prec(3) is "wet"
end

with-prec = build-column(with-buckets, "prec-category", lam(r :: Row) -> String: bucket-prec(get-column(r, "precipitation")) end)

employees =
  table: full-name :: String, department :: String
    row: "Jordan Smith", "Sales"
    row: "Alexandra Lee", "Engineering"
    row: "Sam", "Marketing"
    row: "Ng, Alice", "Operations"
    row: "Smith", "HR"
  end

# Names not normalized:
#   "Ng, Alice" reads last, first
#   "Sam" doesn't include last name
#   "Smith" does not include first name
#   impossible to tell if a single name is last or first

# plan:
#   if name contains ", " first = everything after, last = everything before
#   else if name contains " " first = everything before, last = everything after

