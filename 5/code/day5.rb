require_relative '../../lib/common'

input = parse_input_as_array(get_input_path(5))

$rules = Hash.new { |hash, key| hash[key] = [] }

def add_rule(number, preceding)
    # The numbers in the array must all come before it
    $rules[preceding] << number
end

def validate_update?(update)
    # for i I shouldn't see any of rules[i] after it
    update.each_with_index do |page, i|
        valid = !update[(i+1)..].any? { |element| $rules[page].include?(element) }
        return false unless valid
    end

    return true
end

total = 0
input.each do | row |  
    if(row.include?("|"))
        add_rule(*row.split("|").map(&:to_i))
    elsif row.length > 0
        update = row.split(',').map(&:to_i)
        total += update[(update.length-1)/2] if validate_update?(update) 
    end
end

pp total