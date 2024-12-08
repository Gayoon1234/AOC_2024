require 'set'

INPUT = "1\\input\\input.txt"
l1, l2 = [], []

# Parse input into two arrays
File.foreach(INPUT) do | line |
    v1, v2 = line.split
    l1 << v1.to_i
    l2 << v2.to_i
end

l1.sort!
l2.sort!

### PART 1 ###
# sort the two columns
# sum the difference between the two columns
# combine l1 and l2 then map the difference (absolute value) and sum this
puts l1.zip(l2).map{|v1, v2| (v1-v2).abs}.sum

### PART 2 ###
# Iterate l1 and check l2 for the number of duplicates
# If value in l1 appears x times in l2, add value*x to total

# first calculate how many times each element appears in l2.
l2_totals = Hash.new(0)
l2.each do |value|
    l2_totals[value] += 1
end

# Then iterate l1 and sum the values
total = 0
l1.each do |value|
    total += l2_totals[value]*value
end
puts total

