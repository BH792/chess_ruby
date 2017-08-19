module Bishop
  include DiagonalMovement, Piece

  def bishop_move_validation(coords)
    if is_diagonal?(coords)
      !same_color?(coords) if diagonal_movement_validation(coords)
    else
      false
    end
  end
end
