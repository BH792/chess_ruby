module DiagonalMovement
  def is_diagonal?(coords)
    move_diff = coords[0] - coords[1]
    move_diff % 7 == 0 || move_diff % 9 == 0
  end

  def diagonal_movement_validation(coords)
    move_diff = coords[0] - coords[1]
    diagonal_offset = move_diff % 7 == 0 ? 7 : 9
    move_direction = move_diff > 0 ? -1 : 1
    steps = (move_diff / diagonal_offset).abs
    move_trace = []
    for i in 1..(steps-1) do
      move_trace << (i * move_direction * diagonal_offset) + coords[0]
    end
    move_trace.all? { |square| @board[square] == 0 }
  end
end
