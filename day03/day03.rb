require "set"

input = File.read("day03/day03.txt")

def part_one(moves)
  x = 0
  y = 0
  visited_houses = Set[[x, y]]

  moves.strip.each_char do |move|
    case move
    when "^"
      y -= 1
    when "v"
      y += 1
    when ">"
      x += 1
    when "<"
      x -= 1
    else
      puts "We shouldn't be here!"
      return nil
    end
    visited_houses.add([x, y])
  end

  visited_houses.size
end

def part_two(moves)
  santa_x = robo_santa_x = 0
  santa_y = robo_santa_y = 0
  visited_houses = Set[[santa_x, santa_y]]

  is_santas_move = true
  moves.strip.each_char do |move|
    case move
    when "^"
      is_santas_move ? (santa_y -= 1) : (robo_santa_y -= 1)
    when "v"
      is_santas_move ? (santa_y += 1) : (robo_santa_y += 1)
    when ">"
      is_santas_move ? (santa_x += 1) : (robo_santa_x += 1)
    when "<"
      is_santas_move ? (santa_x -= 1) : (robo_santa_x -= 1)
    else
      puts "We shouldn't be here!"
      return nil
    end

    visited_houses.add(is_santas_move ? [santa_x, santa_y] : [robo_santa_x, robo_santa_y])

    is_santas_move = !is_santas_move
  end

  visited_houses.size
end

puts part_one(input)
puts part_two(input)
