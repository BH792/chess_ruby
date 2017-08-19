module Queen
  include OrthogonalMovement, DiagonalMovement, Piece

  def queen_move_validation(coords)
    if is_diagonal?(coords)
      !same_color?(coords) if diagonal_movement_validation(coords)
    elsif is_orthogonal?(coords)
      !same_color?(coords) if orthogonal_movement_validation(coords, is_orthogonal?(coords))
    else
      false
    end
  end
end
