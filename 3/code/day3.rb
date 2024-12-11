require_relative '../../lib/common'

input = parse_input_as_single_string(get_input_path(3))

puts input.scan(/mul\(\d+\,\d+\)/).map {|instruction|
    instruction.scan(/\d+/)
    .map(&:to_i)
    .reduce(1){|res, ele| res*ele}
}.sum

enabled = true
total_sum = 0

instructions = input.scan(/do\(\)|don't\(\)|mul\(\d+\,\d+\)/)

instructions.each do |instruction|
  case instruction
  when 'do()'
    enabled = true 
  when "don't()"
    enabled = false
  when /mul\(\d+\,\d+\)/
    if enabled
      result = instruction.scan(/\d+/).map(&:to_i).reduce(1) { |res, ele| res * ele }
      total_sum += result
    end
  end
end

puts total_sum
