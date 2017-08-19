module Bishop
  include DiagonalMovement, Piece

  def bishop_move_validation(coords)
    if is_diagonal?(coords)
      diagonal_movement_validation(coords)
    else
      false
    end
  end
end
