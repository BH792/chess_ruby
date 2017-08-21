module Piece
  def same_color?(coords)
    @board[coords[0]] * @board[coords[1]] > 0
  end

  def white_or_black(coordinate)
    @board[coordinate] > 0 ? 1 : -1
  end
end
