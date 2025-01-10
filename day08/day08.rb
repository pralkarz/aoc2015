input = File.read("day08/day08.txt")

def part_one(strings)
  raw = 0
  in_memory = 0
  strings.strip.split.each do |s|
    raw += s.length

    bytes = 0
    p = 1 # start at the second character to skip the leading quote
    while p < s.length - 1 # iterate until the second-to-last character to skip the trailing quote
      case s[p]
      when "\\"
        case s[p + 1]
        when "\\", "\""
          p += 2
        when "x"
          p += 4
        end
      else
        p += 1
      end

      bytes += 1
    end

    in_memory += bytes
  end

  raw - in_memory
end

def part_two(strings)
  raw = 0
  encoded = 0
  strings.strip.split.each do |s|
    raw += s.length

    c = 2
    s.each_char do |char|
      case char
      when "\"", "\\"
        c += 2
      else
        c += 1
      end
    end

    encoded += c
  end

  encoded - raw
end

puts part_one(input)
puts part_two(input)
