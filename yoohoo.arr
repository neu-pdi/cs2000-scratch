use context dcic2024

include csv
  
voter-data = 
  load-table: VoterID,FirstName,LastName,DOB,Party,Address,City,State,Zip,Phone,Email,LastVoted 
    source: csv-table-file("voter.csv", default-options)
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




##5) I would use string-substring to extract and separate the data into pieces and then reorganise to fit the format so it can all be changed with one set of code. 