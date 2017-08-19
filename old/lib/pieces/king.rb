require_relative "piece"

class King < Piece
  def move_trace(current_index, target_index)
    move_diff = current_index - target_index

    if [1, 8, 7, 9].include?(move_diff.abs)
      [target_index]
    elsif (target_index == 6 || target_index == 62) || !@has_moved
      "Castle"
    end
  end
end
