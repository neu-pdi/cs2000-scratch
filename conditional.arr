use context dcic2024

data PaymentMethod:
  | cash
  | credit(card-number :: String, expiry :: String, card-type :: String)
  | checking(bank-account :: String, routing :: String, check-number :: Number)
end

payment-1 = cash
payment-2 = credit("1111-2222-3333-4444", "09/26", "credit")
payment-2_5 = credit("1111-2222-3333-4444", "09/26", "debit")
payment-3 = checking("987654321", "111", 55)


fun display-payment(p :: PaymentMethod):
  cases (PaymentMethod) p:
    | cash => "Paid in cash"
    | credit(card-number, expiry, card-type) => "Paid by " + card-type + " expiring on " + expiry
    | checking(acc, rout, num) => "Paid by check from account " + acc
  end
where:
  display-payment(payment-1) is "Paid in cash"
  display-payment(payment-2) is "Paid by credit expiring on 09/26"
  display-payment(payment-3) is "Paid by check from account 987654321"
  display-payment(payment-2_5) is "Paid by debit expiring on 09/26"
end


#Define a Vehicle data type with three variants: bike (no fields), car (with make and year fields), and truck (with make, year, and capacity fields). Create one example of each variant.

data Vehicle:
  | bike
  | car(make :: String, year :: Number)
  | truck(make :: String, year :: Number, capacity-fields :: String)
end


ve1 = bike
ve2 = car("SRT Hellcat", 2007)
ve3 = truck("F-Series", 2018, "100KG")

#Write a function vehicle-age that takes a Vehicle and the current year, and returns the age in years. For bikes, return 0.

fun vehicle-age(current-year :: Number, v :: Vehicle): 
  cases (Vehicle) v:
    | bike => 0
    | car(make, year) => (current-year - ve2.year)
    | truck(mak, yr, cap) => (current-year - ve3.year)
  end
where:
  vehicle-age(2025, ve1) is 0
  vehicle-age(2025, ve2) is 18
  vehicle-age(2025, ve3) is 7
end

#Define a WeatherReport with variants: sunny (temperature only), rainy (temperature and precipitation amount), and snowy (temperature, precipitation, and wind speed). Write a function is-severe that returns true if: rainy with >2 inches, snowy with >30 mph wind, or sunny above 95°F.

data WeatherReport:
  | sunny(temp :: Number)
  | rainy(temp :: Number, precip-amount :: Number)
  | snowy(temp :: Number, precip-amount :: Number, winds :: Number)
end


w1 = sunny(96)
w2 = rainy(200, 3)
w3 = snowy(30000000, 1, 31)



fun is-severe(w :: WeatherReport):
  cases (WeatherReport) w:
    | sunny(temp) =>  if (temp > 95): true
      else: false
      end
    |rainy(temp, precip-amount) => if (precip-amount > 2): true else: false
      end
    |snowy(temp, precip, winds) => if (winds > 30): true
      else: false
      end
  end
where: 
  is-severe(w1) is true
  is-severe(w2) is true
  is-severe(w3) is true
end













data Beverage:
  | coffee(num-shots :: Number)
  | tea(name :: String, brew-time :: Number)
end


b1 = coffee(3)
b2 = tea("green tea", 10)
b3 = coffee(1)


fun is-strong(b :: Beverage):
  cases (Beverage) b:
    | coffee(sh) => if (sh > 2): true
      else: false
      end
    | tea(gren, tm) => if (tm > 5): true
      else: false
      end
  end
where: 
  is-strong(b1) is true
  is-strong(b2) is true
  is-strong(b3) is false
end