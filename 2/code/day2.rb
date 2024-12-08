require_relative '../../lib/common'

reports = parse_input_as_numeric(get_input_path(2))

def is_safe(report)

    # check if the report is in ascending or descending order
    is_ascending = report == report.sort
    is_descending = report == report.sort.reverse
    return false unless is_ascending || is_descending
    
    # Set to first element
    last_level = report[0]

    # Compare differences and return false if violation
    report[1..].each do |level|
        return false if (last_level-level).abs > 3 or last_level == level
        last_level = level
    end

    # default
    return true
end


def is_safe_ish(report)
    # Generate combinations of length minus one, this 
    # simulates removing a different level each time
    # report.combination(report.length - 1).to_a.each do |line|
    #     return true if is_safe(line)
    # end
    # return false

    report.combination(report.length - 1).any? { |line| is_safe(line) }
end

### PART 1 ###
# check how many meet requirements
safe = reports.count {|level| is_safe(level)}
puts safe

### PART 2 ###
# check how many meet requirements if a level is removed.
safeish = reports.count {|level| is_safe_ish(level) }
puts safeish

# Note: Solution can probably be made faster if both parts were run at once
# as currently part two re-reruns result from part 1

# part1, part2 = 0,0
# reports.each do |x|
#     if is_safe(x)
#         part1+=1
#         part2+=1
#     elsif is_safe_ish(x)
#         part2+=1
#     end
# end
# puts part1, part2
     
