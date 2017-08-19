module Rook
  include OrthogonalMovement, Piece
  def rook_move_validation(coords)
    direction = is_orthogonal?(coords)
    if direction
      !same_color?(coords) if orthogonal_movement_validation(coords, direction)
    else
      false
    end
  end
end
