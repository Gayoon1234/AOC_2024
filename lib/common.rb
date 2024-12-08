require_relative 'constants'

def parse_input_two_columns(input_file)
    l1, l2 = [], []
  
    # Parse input into two arrays
    File.foreach(input_file) do |line|
      v1, v2 = line.split
      l1 << v1.to_i
      l2 << v2.to_i
    end
  
    return l1, l2
end

def get_input_path(day)
    return day.to_s << INPUT
end
  