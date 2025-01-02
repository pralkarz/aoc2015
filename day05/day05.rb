require "set"

input = File.read("day05/day05.txt")

def part_one(strings)
  nice_strings = 0
  strings.strip.split do |s|
    vowels = 0
    has_double_letter = false
    has_disallowed_substring = false
    l = s.length
    for i in 0..l - 1
      if i < l - 1
        case s[i..i + 1]
          when "ab", "cd", "pq", "xy"
            has_disallowed_substring = true
            break
        end

        if !has_double_letter && s[i] == s[i + 1]
          has_double_letter = true
        end
      end

      case s[i]
        when "a", "e", "i", "o", "u"
          vowels += 1
      end
    end

    if vowels >= 3 && has_double_letter && !has_disallowed_substring
      nice_strings += 1
    end
  end

  nice_strings
end

def part_two(strings)
  nice_strings = 0
  strings.strip.split do |s|
    pairs = Set[]
    has_duplicate_pair = false
    has_palindrome = false
    i = 0
    l = s.length
    while i < l do
      if i < l - 1
        if !pairs.add?(s[i..i + 1])
          has_duplicate_pair = true
        end
      end

      if i < l - 2
        if s[i] == s[i + 2]
          has_palindrome = true
          if s[i] == s[i + 1]
            i += 2
            next
          end
        end
      end

      i += 1
    end
    
    if has_duplicate_pair && has_palindrome
      nice_strings += 1
    end
  end

  nice_strings
end

puts part_one(input)
puts part_two(input)

