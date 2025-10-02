use context dcic2024

import math as M
import statistics as S
include csv
include data-source


cafe-data =
  table: day :: String, drinks-sold :: Number
    row: "Mon", 45
    row: "Tue", 30
    row: "Wed", 55
    row: "Thu", 40
    row: "Fri", 60
  end


sales = cafe-data.get-column("drinks-sold")
M.max(sales)      # maximum sales
S.mean(sales)     # average sales
M.sum(sales)      # total sold


soulja = cafe-data.get-column("drinks-sold")



# Class exercise
days = cafe-data.get-column("day")


M.min(days) 

M.sum(soulja)


quiz-scores =
  table: student :: String, quiz1 :: Number, quiz2 :: Number, quiz3 :: Number
    row: "Alice", 85, 92, 78
    row: "Bob", 90, 88, 95
    row: "Charlie", 78, 85, 82
    row: "Diana", 95, 90, 88
  end

quizuno = quiz-scores.get-column("quiz1")
quizdos = quiz-scores.get-column("quiz2")
quiztres = quiz-scores.get-column("quiz3")


S.mean(quizuno)
S.mean(quizdos)
S.mean(quiztres)

# Quiz two had the highest average score.

cust-list = [list: 12, 8, 15, 22, 5, 18]

# min max sum range

jonah = M.min(cust-list)
monah = M.max(cust-list)
M.sum(cust-list)

eighteenminusone = monah - jonah


jonah-hill =load-table:NAME :: String, DEPARTMENT_NAME :: String, TITLE :: String, REGULAR :: Number, RETRO :: String, OTHER :: String, OVERTIME :: String,INJURED :: String,DETAIL :: String ,QUINN_EDUCATION :: String,TOTAL-GROSS :: String,POSTAL :: String
  source: csv-table-url("https://data.boston.gov/dataset/418983dc-7cae-42bb-88e4-d56f5adcf869/resource/579a4be3-9ca7-4183-bc95-7d67ee715b6d/download/employee_earnings_report_2024.csv", default-options)
end
  

# dont need to wrtie string for each btw
# also get an error on purpose by only writing one and then just copy paste it. Rush is a genius.


fun string-to-number-unsafe(s :: String) -> Number:
  doc: "Converts the given string to a number, returning 0 if not well formatted"
  string-to-number(string-replace(s, ",", "")).or-else(0)
where:
  string-to-number-unsafe("1234") is 1234
  string-to-number-unsafe("-1.3") is -1.3
  string-to-number-unsafe("hello") is 0
end


jonah-shmill = transform-column(jonah-hill, "REGULAR", string-to-number-unsafe)
  
  


listy = jonah-shmill.get-column("REGULAR")

S.mean(listy)

# 