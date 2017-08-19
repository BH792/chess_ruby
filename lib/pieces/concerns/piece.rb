module Piece
  def same_color?(coords)
    @board[coords[0]] * @board[coords[1]] > 0
  end
end

puts "piece"
