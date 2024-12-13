require_relative '../../lib/common'

input = parse_input_as_array(get_input_path(4))

### PART 1 ###

# Regex each line of XMAS or SAMX
# This picks up all of the horizontal words
h_total =  input.sum do |h_line|
    h_line.scan(/XMAS/).length +  h_line.scan(/SAMX/).length
end

# By transposing the array we can use the same approach for the
# vertical words.
transposed_input = input.map(&:chars).transpose.map(&:join)

v_total = transposed_input.sum do |v_line|
    v_line.scan(/XMAS/).length + v_line.scan(/SAMX/).length
end

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

pg_total =  increment.sum do |d_line|
    d_line.scan(/XMAS/).length +  d_line.scan(/SAMX/).length
end

# Same as above but for negative-diagonal words
decrement = (
    input.map.with_index { |row, i| 
        " "*(row.length-i-1) + row + " "*i
    })
    .map(&:chars)
    .transpose
    .map(&:join)

ng_total =  decrement.sum do |d_line|
    d_line.scan(/XMAS/).length +  d_line.scan(/SAMX/).length
end

pp v_total + h_total + pg_total + ng_total