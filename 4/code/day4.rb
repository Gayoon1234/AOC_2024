require_relative '../../lib/common'

input = parse_input_as_array(get_input_path(4))

### PART 1 ###
def count_xmas_smax(arr)
    arr.sum do |d_line|
        d_line.scan(/XMAS/).length +  d_line.scan(/SAMX/).length
    end
end

# Regex match each line of XMAS or SAMX
# This picks up all of the horizontal words
h_total = count_xmas_smax(input)

# By transposing the array we can use the same approach for the
# vertical words.
transposed_input = input.map(&:chars).transpose.map(&:join)

v_total = count_xmas_smax(transposed_input)

# First we pad the array so that all of the positive-diagonal words are
# realigned to be vertical. Then transpose it so that all of the diagonal
# words are now horizontal.
increment = (
    input.map.with_index { |row, i| 
        " "*i + row + " "*(row.length-i-1)
    })
    .map(&:chars)
    .transpose
    .map(&:join)

pg_total = count_xmas_smax(increment)

# Same as above but for negative-diagonal words
decrement = (
    input.map.with_index { |row, i| 
        " "*(row.length-i-1) + row + " "*i
    })
    .map(&:chars)
    .transpose
    .map(&:join)

ng_total =  count_xmas_smax(decrement)

pp v_total + h_total + pg_total + ng_total

### PART 2 ###

# Pretty silly solution, basically I covert the input to a string
# and regex scan for the full pattern taking into account the number of chars
# between the middle A and the M.S

LINE = input[0].length-1

# N for new line - otherwise there are false positives where X's can be created
# by wrapping around the input
input_str = input.join("N") 
outcomes = ["MSMS", "MMSS", "SSMM", "SMSM"]


total =  outcomes.sum do |c|
    input_str.scan(/(?=#{c[0]}[^N]#{c[1]}.{#{LINE}}A.{#{LINE}}#{c[2]}[^N]#{c[3]})/).length
end

pp total