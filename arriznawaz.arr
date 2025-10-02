use context dcic2024

include csv
include data-source

smth = load-table: Location, Subject, Date
  source: csv-table-url("https://raw.githubusercontent.com/neu-pdi/cs2000-public-resources/refs/heads/main/static/support/7-photos.csv", default-options)
end

subjects = smth.get-column("Subject")