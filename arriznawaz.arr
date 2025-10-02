use context dcic2024

include csv
include data-source
import lists as L

smth = load-table: Location, Subject, Date
  source: csv-table-url("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/support/7-photos.csv", default-options)
end

subjects = smth.get-column("Subject")



b3 = L.distinct(subjects)
nawa-z = L.length(b3)

























b = "ariz nawaz "


b1 = string-repeat(string-append(b, b), 5)

b2 = string-repeat(string-append(b1, b1), 5)

b4 = string-repeat(string-append(b2, b2), 5)


string-length(b4)