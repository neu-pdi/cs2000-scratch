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

