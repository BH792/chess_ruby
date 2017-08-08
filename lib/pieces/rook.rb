require_relative "piece"

class Rook < Piece
  def move_trace(current_index, target_index)
    move_diff = current_index - target_index
    move_direction = move_diff > 0 ? -1 : 1
    move_trace = []

    if move_diff % 8 == 0
      steps = (move_diff.abs / 8)

      for i in 1..steps do
        move_trace << (i * move_direction * 8) + current_index
      end
    else
      for i in 0..7 do
        if (current_index - (i * 8)).abs < 8 && (target_index - (i * 8)).abs < 8
          move_increment = 1
          until move_trace[-1] == target_index
            move_trace << (move_increment * move_direction) + current_index
            move_increment += 1
          end
        end
      end
    end


    move_trace
  end
end
