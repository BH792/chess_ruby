require_relative "piece"

class Knight < Piece
  def move_trace(current_index, target_index)
    move_diff = current_index - target_index

    if [6, 10, 15, 17].include?(move_diff.abs)
      [target_index]
    else
      []
    end
  end
end
