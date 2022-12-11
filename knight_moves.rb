# frozen_string_literal: true

def knight_moves(origin, destination)
  queue = [[origin, [origin]]]
  until queue.empty?
    current = queue.shift
    node, path = current
    return path if node == destination

    moves = moves(current)
    queue.concat(moves)
  end
end

DIRECTIONS = [
  [-2, 1],
  [-2, -1],
  [1, 2],
  [-1, 2],
  [2, 1],
  [2, -1],
  [1, -2],
  [-1, -2]
].freeze

def moves(position)
  moves = []
  node, path = position
  DIRECTIONS.each do |direction|
    new_x = node[0] + direction[0]
    new_y = node[1] + direction[1]
    next unless new_x.between?(0, 7) && new_y.between?(0, 7)

    new_path = path.clone << [new_x, new_y]
    moves << [[new_x, new_y], new_path]
  end
  moves
end

moves = knight_moves([3, 3], [4, 3])
puts "You made it in #{moves.size - 1} moves!  Here's your path:"
moves.each { |move| print "#{move}\n" }
