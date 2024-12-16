require_relative '../../lib/common'

$input = parse_input_as_array(get_input_path(6))

## PART 1 ##

# Finding where the starting position is
x,y = 0,0
$input.each_with_index do |row, i|
    location = row.index("^")
    if location
        x,y = location, i
        break
    end
end

# No enums in Ruby so we use this
# Could also use a hash but I like this syntax
module Directions
  UP =  1
  DOWN = -1
  LEFT =  -2
  RIGHT =  2
end

# Traverse the guards path, backtracking and changing direction when hitting
# a wall
def move_guard(x, y, direction)
    return if x < 0 || y < 0 || y >= $input.length || x >= $input[y].length
    
    case(direction)
        when Directions::UP
            if $input[y][x] == "." || $input[y][x] == "^" || $input[y][x] == "X"  
                $input[y][x] = "X"
                move_guard(x,y-1,direction)
            elsif $input[y][x] == "#"
                move_guard(x,y+1, Directions::RIGHT)
            end

        when Directions::RIGHT
            if $input[y][x] == "." || $input[y][x] == "X"
                $input[y][x] = "X"
                move_guard(x+1, y, Directions::RIGHT)
            elsif $input[y][x] == "#"
                move_guard(x-1, y, Directions::DOWN)
            end

        when Directions::DOWN
            if $input[y][x] == "." || $input[y][x] == "X"
                $input[y][x] = "X"
                move_guard(x, y+1, Directions::DOWN)
            elsif $input[y][x] == "#"
                move_guard(x, y-1, Directions::LEFT)
            end

        when Directions::LEFT
            if $input[y][x] == "." || $input[y][x] == "X"
                $input[y][x] = "X"
                move_guard(x-1, y, Directions::LEFT)
            elsif $input[y][x] == "#"
                move_guard(x+1, y-1, Directions::UP)
            end
    end
end

move_guard(x,y,Directions::UP)

# Could have possibly be done in the above method
# by keeping a running counter
total =  $input.sum do |row|
    row.count("X")
end

pp total 