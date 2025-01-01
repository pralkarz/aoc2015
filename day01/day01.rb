input = File.read("day01/day01.txt")

def part_one(floors)
  current_floor = 0
  floors.strip.each_char do |floor|
    if floor == "("
      current_floor += 1
    else
      current_floor -= 1
    end
  end

  current_floor
end

def part_two(floors)
  current_floor = 0
  count = 0
  floors.strip.each_char do |floor|
    count += 1

    if floor == "("
      current_floor += 1
    else
      current_floor -= 1
    end

    if current_floor < 0
      return count
    end
  end

  puts "We shouldn't be here!"
end

puts part_one(input)
puts part_two(input)

