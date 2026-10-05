use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

fun tax(r :: Row) -> Number:
  doc: "Returns 106% of price for sales tax"
  price = get-column(r, "price")
  price * 1.06
end


fun sales-tax(t :: Table) -> Table:
  doc: "adds 'tax' column which is 6% of price"

  build-column(t, "tax", lam(r :: Row) -> Number: 
    r["price"] * 0.06
  end)

where:
  test-table =
    table: price
      row: 50
      row: 120
      row: 80
      row: 40
    end
    
  sales-tax(test-table) is
  table: price, tax
    row: 50,  50 * 0.06
    row: 120, 120 * 0.06
    row: 80,  80 * 0.06
    row: 40,  40 * 0.06
  end
end

fun obfuscate(t :: Table) -> Table:
  doc: "obfuscates names with X"

  transform-column(t, "name", lam(name :: String) -> String: 
      string-repeat("X", string-length(name))
  end)

where:
  test-table =
    table: name
      row: "Anthony"
      row: "John"
      row: "Billy"
    end
    
  obfuscate(test-table) is
  table: name
    row: "XXXXXXX"
    row: "XXXX"
    row: "XXXXX"
  end
end


