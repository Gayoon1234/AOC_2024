root_dir = File.dirname(__FILE__)

(1..25).each do |day|
  day_dir = File.join(root_dir, day.to_s, 'code')
  day_file = File.join(day_dir, "day#{day}.rb")

  if File.exist?(day_file)  
    puts "***   DAY #{day}  ***" 
    output = `ruby #{day_file}`
    outputs = output.split("\n")  

    puts "Part 1: " << outputs[0]
    puts outputs.length == 2 ? "Part 2: " << outputs[1] : "No part 2"
    
  else
    puts "Skipped #{day}"
  end
end