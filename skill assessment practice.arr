use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

#SA1

fun check-age(a :: Number) -> Boolean:
  doc: "Chekcs if person is 21 or older"
  if a >= 21:
    true
  else:
    false
  end
where:
  check-age(19) is false
  check-age(25) is true
  check-age(21) is true
end

fun check-year(y :: Number) -> String:
  doc: "checks if year is past present or future"
  if y == 2026:
    "present"
  else if y > 2026:
    "future"
  else:
    "past"
  end
where:
  check-year(2028) is "future"
  check-year(2023) is "past"
  check-year(2026) is "present"
end