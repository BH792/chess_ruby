
Dir["./lib/*.rb"].each {|file| require file }
Dir["./lib/pieces/*.rb"].each {|file| require file }

#
# require_relative "../lib/board"
# require_relative "../lib/pieces/piece"
# require_relative "../lib/pieces/orthogonal_moves"
# require_relative "../lib/pieces/rook"
