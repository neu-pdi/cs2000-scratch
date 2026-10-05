use context url-file("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/","cs2000.arr")

include csv
  
voter-data = 
  load-table: VoterID,FirstName,LastName,DOB,Party,Address,City,State,Zip,Phone,Email,LastVoted 
    source: csv-table-file("voter-data.csv", default-options)
end

republicans = filter-with(voter-data, lam(r :: Row) -> Boolean:
  get-column(r, "Party") == "Republican" end)

# change voters with unspecified affilition as independent

# transform column

fun clean-party-column(p :: String) ->  String:
  doc: "Changes blank values to independent"
  if p == "":
    "Independent"
  else:
    p
  end
where:
  clean-party-column("") is "Independent"
  clean-party-column("Democrat") is "Democrat"
end

voters-with-indep = transform-column(voter-data, "Party", clean-party-column)

fun normalize-phone(s :: String) -> String:
  doc: "Normalizes all phone numbers with 'N'"
  s1 = string-replace(s, " ", "")
  s2 = string-replace(s1, ".", "")
  s3 = string-replace(s2, "(", "")
  s4= string-replace(s3, ")", "")
  s5 = string-replace(s4, "-", "")
  s5
end

normalized-num = transform-column(voter-data, "Phone", normalize-phone)
  
fun fix-dob(s :: String) -> String:
  string-replace(s, "/", "-")
end

fixed-dob = transform-column(voter-data, "DOB", fix-dob)

