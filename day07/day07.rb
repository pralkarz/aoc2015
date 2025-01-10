require "set"

input = File.read("day07/day07.txt")

class String
  def is_integer?
    true if Integer(self) rescue false
  end
end

def get_operations(circuit, override_b_with = nil)
  operations = Set[]
  circuit.strip.split("\n").each do |instruction|
    left, right = instruction.split(" -> ")
    left = left.split

    if left.length == 1
      if right == "b" && override_b_with
        operations.add({ input: override_b_with.to_s, op: "ASSIGN", output: right })
      else
        operations.add({ input: left[0], op: "ASSIGN", output: right })
      end
    elsif left.length == 2
      operations.add({ input: left[1], op: left[0], output: right })
    else
      operations.add({ inputs: [left[0], left[2]], op: left[1], output: right })
    end
  end

  operations
end

MASK = 65535
OPS = { AND: :&, OR: :|, LSHIFT: :<<, "RSHIFT": :>> }

def get_output(operations)
  signals = {}
  while operations.length > 0
    to_remove = Set[]
    operations.each do |operation|
      case operation[:op]
      when "ASSIGN", "NOT"
        input = operation[:input]
        input = input.is_integer? ? input.to_i : signals[input]
        if input
          signals[operation[:output]] = operation[:op] == "ASSIGN" ? input : input ^ MASK
          to_remove.add(operation)
        end
      when "AND", "OR", "LSHIFT", "RSHIFT"
        left, right = operation[:inputs]
        left = left.is_integer? ? left.to_i : signals[left]
        right = right.is_integer? ? right.to_i : signals[right]
        if left && right
          signals[operation[:output]] = left.public_send(OPS[operation[:op].to_sym], right)
          to_remove.add(operation)
        end
      end
    end

    operations -= to_remove
  end

  signals["a"]
end

def part_one(circuit)
  operations = get_operations(circuit)
  get_output(operations)
end

def part_two(circuit)
  override_b_with = part_one(circuit)

  operations = get_operations(circuit, override_b_with)
  get_output(operations)
end

puts part_one(input)
puts part_two(input)
