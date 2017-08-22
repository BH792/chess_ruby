# !/usr/local/bin/ruby -w
require_relative "../config/environment"

def reload!
load_all "lib"
end

c = Console.new
turn = 1
check_mate = false
c.print

while !check_mate
  c.get_valid_move_coords
  c.print
  turn += 1
  check_mate = c.board.is_checkmate?
end

puts "Checkmate"
