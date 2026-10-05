use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

include csv

orders = table: time :: String, amount :: Number
  row: "08:00", 10.50
  row: "09:30", 5.75
  row: "10:15", 8.00
  row: "11:00", 3.95
  row: "14:00", 4.95
  row: "16:45", 7.95
end

high-value-orders = table: time :: String, amount :: Number
  row: "08:00", 10.50
  row: "10:15", 8.00
end

fun is-high-value(x :: Row) -> Boolean:
  doc: "Determines whether or not a row is high value"
  value = get-column(x, "amount")
  if value >= 8:
    true
  else:
    false
  end
where:
  is-high-value(get-row(orders, 2)) is true
  is-high-value(get-row(orders, 1)) is false
end

check:
  filter-with(orders, is-high-value) is high-value-orders
end

fun is-morning(x :: Row) -> Boolean:
  doc: "Determines whether or not an order is in the morning"
  time = get-column(x, "time")
  if time < "12:00":
    true
  else:
    false
  end
where:
  is-morning(get-row(orders, 0)) is true
  is-morning(get-row(orders, 5)) is false
end

morning-orders = filter-with(orders, is-morning)

late-to-early = order-by(morning-orders, "time", false)

latest-morning = get-row(late-to-early, 0)


world = load-table:
  location :: String,
  subject :: String,
  date :: String
  source: csv-table-url("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/support/7-photos.csv", default-options)
end

fun is-forest(x :: Row) -> Boolean:
  doc: "Determines whether or not subject is Forest"
  subject = get-column(x, "subject")
  if subject == "Forest":
    true
  else:
    false
  end
where:
  is-forest(get-row(world, 12)) is true
  is-forest(get-row(world, 0)) is false
end

forests = order-by(filter-with(world, is-forest), "date", true)

recent-forest = forests.row-n(forests.length() - 1)