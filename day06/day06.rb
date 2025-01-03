input = File.read("day06/day06.txt")

def part_one(instructions)
  lights = Array.new(1000) { Array.new(1000) { false } }

  instructions.strip.split("\n") do |instruction|
    left, right = instruction.split(" through ")

    left = left.split
    case left[0]
    when "turn"
      action = left[1]
    when "toggle"
      action = left[0]
    else
      puts "We shouldn't be here!"
      return
    end
    start_x, start_y = left[-1].split(",").map(&:to_i)

    end_x, end_y = right.split(",").map(&:to_i)

    for y in start_y..end_y
      for x in start_x..end_x
        case action
        when "on"
          lights[y][x] = true
        when "off"
          lights[y][x] = false
        when "toggle"
          lights[y][x] = !lights[y][x]
        else
          puts "We shouldn't be here!"
          return
        end
      end
    end
  end

  turned_on_lights = 0
  lights.each do |row|
    row.each do |light|
      if light
        turned_on_lights += 1
      end
    end
  end

  turned_on_lights
end

def part_two(instructions)
  brightnesses = Array.new(1000) { Array.new(1000) { 0 } }

  instructions.strip.split("\n") do |instruction|
    left, right = instruction.split(" through ")

    left = left.split
    case left[0]
    when "turn"
      action = left[1]
    when "toggle"
      action = left[0]
    else
      puts "We shouldn't be here!"
      return
    end
    start_x, start_y = left[-1].split(",").map(&:to_i)

    end_x, end_y = right.split(",").map(&:to_i)

    for y in start_y..end_y
      for x in start_x..end_x
        case action
        when "on"
          brightnesses[y][x] += 1
        when "off"
          if brightnesses[y][x] > 0
            brightnesses[y][x] -= 1
          end
        when "toggle"
          brightnesses[y][x] += 2
        else
          puts "We shouldn't be here!"
          return
        end
      end
    end
  end

  total_brightness = 0
  brightnesses.each do |row|
    row.each do |brightness|
      total_brightness += brightness
    end
  end

  total_brightness
end

puts part_one(input)
puts part_two(input)
