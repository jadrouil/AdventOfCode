#calculates day1 part1
filename = "input"
f = File.new(filename, 'r')
floor = 0

f.each do |line|
  line.each_char do |char|
    if char == '('
      floor += 1
    elsif char == ')'
      floor -= 1
    end
  end
end

f.close

puts "Santa ends on floor #{floor}"


#calculates day2 part2

f = File.new(filename, 'r')
floor = 0
character_position = 1
f.each do |line|
  line.each_char do |char|
    if char == '('
      floor += 1
    elsif char == ')'
      floor -= 1
    end


    if floor == -1
      puts "first entered basement on char: #{character_position}"
      exit
    end
    character_position += 1
  end
end
