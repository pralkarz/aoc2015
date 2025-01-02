require "digest"

input = File.read("day04/day04.txt")

def both_parts(secret_key, prefix)
  secret_key = secret_key.strip

  md5 = Digest::MD5.new

  num = 0
  loop do
    md5.update "#{secret_key}#{num}"
    if md5.hexdigest.start_with?(prefix)
      return num
    end
    md5.reset

    num += 1
  end
end

puts both_parts(input, "00000")
puts both_parts(input, "000000")
