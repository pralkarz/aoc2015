input = File.read("day02/day02.txt")

def part_one(boxes)
  wrapping_paper = 0
  boxes.strip.split do |box|
    length, width, height = box.split("x").map(&:to_i)
    a = length * width
    b = width * height
    c = height * length

    wrapping_paper += 2 * a
    wrapping_paper += 2 * b
    wrapping_paper += 2 * c

    smallest_area = a
    if b < smallest_area
      smallest_area = b
    end
    if c < smallest_area
      smallest_area = c
    end
    wrapping_paper += smallest_area
  end

  wrapping_paper
end

def part_two(boxes)
  ribbon = 0
  boxes.strip.split do |box|
    length, width, height = box.split("x").map(&:to_i)
    a = 2 * length + 2 * width
    b = 2 * width + 2 * height
    c = 2 * height + 2 * length

    shortest_perimeter = a
    if b < shortest_perimeter
      shortest_perimeter = b
    end
    if c < shortest_perimeter
      shortest_perimeter = c
    end
    ribbon += shortest_perimeter

    bow = length * width * height
    ribbon += bow
  end

  ribbon
end

puts part_one(input)
puts part_two(input)
