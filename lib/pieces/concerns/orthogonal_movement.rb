module OrthogonalMovement
  def is_orthogonal?(coords)
    move_diff = coords[0] - coords[1]
    if move_diff % 8 == 0
      "vertical"
    elsif (coords[0] / 8) == (coords[1] / 8)
      "horizontal"
    else
      false
    end
  end

  def orthogonal_movement_validation(coords, direction)
    move_diff = coords[0] - coords[1]
    move_direction = move_diff > 0 ? -1 : 1
    move_trace = []
    if direction == "vertical"
      steps = (move_diff.abs / 8)
      for i in 1..(steps - 1) do
        move_trace << (i * move_direction * 8) + coords[0]
      end
    elsif direction == "horizontal"
      for i in 1..(move_diff.abs)
        move_trace << (i * move_direction) + coords[0]
      end
    end
    move_trace.all? { |square| @board[square] == 0 }
  end
end
