use context dcic2024
import math as M
var my-var = 3

my-var := 30000000000000


 
#listy = {1 , 2, "machine", "bogey", 5}

  #. Block (new keyword)


#for each( from listy):






#end
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



fun my-sim(l :: List) block:
  
    #M.sum(l)
    # M.max(l)
  
    var total = 0
    for each(item from l):
    total := total + item 
  end 
  total
end
  


fun sum-even-numbers(l :: List) block:
  var even = 0
  for each(item from l)block:
    even := even + if num-modulo(item, 2) == 0: item
    else: 0
  end
end
  even
  
where:
  
  sum-even-numbers([list: 1, 4, 6, 5, 10,]) is 20
end


fun any-negative(n :: List)block:
  var neg = 0
  for each(item from n):
    neg := if item < 0: true 
    
    else: false
      
      
    end
  end
  neg
  
where:
  
  any-negative([list: 1, 2, -4392323, 3]) is true
  any-negative([list: 1, 2, 3]) is false

end