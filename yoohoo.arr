use context dcic2024

include csv
  
voter-data = 
  load-table: VoterID,FirstName,LastName,DOB,Party,Address,City,State,Zip,Phone,Email,LastVoted 
    source: csv-table-url("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/support/10-voters.csv", default-options)
end



filter-with(voter-data, lam(r :: Row): r["Party"] == "Republican" end)



voters-with-independents = transform-column(voter-data,
  "Party",
lam(p :: String):
  if p == "":
    "Independent"
  else:
    p
  end
end
  )

