use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

include csv
items = table: item :: String, x-coordinate :: Number, y-coordinate :: Number
row: "Sword of Dawn", 4, 3
row: "Healing Potion", -45, 12
row: "Dragon Shield", 78, -56
row: "Magic Staff", -9, 64
row: "Elixir of Strength", 51, -33
row: "Cloak of Invisibility", -66, 5
row: "Ring of Fire", 38, -92
row: "Boots of Swiftness", -17, 49
row: "Amulet of Protection", 82, -74
row: "Orb of Wisdom", -29, -21
end

fun distance(row :: Row) -> Number:
doc: "Calculates distance for coordinates using x and y coordinates"
x = get-column(row, "x-coordinate")
y = get-column(row, "y-coordinate")
num-sqrt(num-sqr(x) + num-sqr(y))
where:
distance(get-row(items, 1)) is-roughly num-sqrt(num-sqr(-45) + num-sqr(12))
distance(get-row(items, 0)) is-roughly 5
end


items2 = build-column(items,'distance', distance)

fun sub-10(n :: Number) -> Number:
doc: "subtracts the number by 10 units"
n - 10
where:
sub-10(85) is 75
sub-10(-10) is -20
end
transform-column(items, "x-coordinate", sub-10)

fun scale-number(n :: Number) -> Number:
n * 0.9
end
newx = transform-column(items, 'x-coordinate', scale-number)
newy = transform-column(newx, 'y-coordinate', scale-number)
closestdistance = transform-column(items2, 'distance',num-to-rational)
sorted-distance = order-by(closestdistance, 'distance', true)
get-row(sorted-distance, 0)

fun obfuscate(s :: String) -> String:
string-repeat("X", string-length(s))
end
newtable = transform-column(sorted-distance, 'item', obfuscate)
newtable

########################
earnings-report = load-table:
ID :: String,
Name :: String,
Deparment-name :: String,
Title :: String,
Regular :: String,
Other :: String,
Overtime :: String,
Injured :: String,
Detail :: String,
Quinn-Education :: String,
Total-Gross :: String,
Postal :: String
source: csv-table-url("https://data.boston.gov/dataset/418983dc-7cae-42bb-88e4-d56f5adcf869/resource/29b3544f-752a-4cb1-a6af-a1de153d20a0/download/employee-earnings-report-2025.csv", default-options)
end
fun earnings-to-number(s :: String) -> Number:
doc: "Converts a possibly comma-formatted earnings string to a number, using 0 if empty or invalid"
string-to-number-default(0)(string-replace(s, ",", ""))
where:
earnings-to-number("1234") is 1234
earnings-to-number("1,234") is 1234
earnings-to-number("-1.3") is -1.3
earnings-to-number("hello") is 0
end

total = transform-column(earnings-report, 'Total-Gross', earnings-to-number)
no-detail = transform-column(total, 'Detail', earnings-to-number)
fun subtract-detail(r :: Row) -> Number:
r["Total-Gross"] - r["Detail"]
end
final-total = build-column(no-detail, "total", subtract-detail)
final-order = order-by(final-total, "total", false)

labeled-plot = labeled-scatter-plot(final-order, "item", "x-coordinate", "y-coordinate")