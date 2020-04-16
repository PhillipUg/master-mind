ar1 = ["R", "G", "R", "B"]
ar2 = ["R", "R", "R", "R"]

# p ar2.count {|ele| ar1.include?(ele) unless ar2.index(ele) == ar1.index(ele)}
 p ar2.difference(ar1) 