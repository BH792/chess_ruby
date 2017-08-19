require_relative "piece"

class Bishop < Piece
  def move_trace(current_index, target_index)
    move_diff = current_index - target_index
    move_direction = move_diff > 0 ? -1 : 1
    move_trace = []

    if move_diff % 7 == 0 || move_diff % 9 == 0
      diagonal_offset = move_diff % 7 == 0 ? 7 : 9
      steps = move_diff % 7 == 0 ? move_diff.abs / 7 : move_diff.abs / 9

      for i in 1..steps do
        move_trace << (i * move_direction * diagonal_offset) + current_index
      end
    end

    move_trace
  end
end
