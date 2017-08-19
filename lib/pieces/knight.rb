module Knight
  include Piece
  def knight_move_validation(coords)
    move_diff = coords[0] - coords[1]
    if [6, 10, 15, 17].include?(move_diff.abs)
      !same_color(coords)
    end
  end
end
