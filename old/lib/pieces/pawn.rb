require_relative "piece"

class Pawn < Piece
  def pawn_valid_moves
    valid_moves = []
  end

  def move_trace(current_index, target_index)
    move_diff = current_index - target_index
    player_direction = @color == "white" ? -1 : 1


    if move_diff == 16 * player_direction && !@has_moved
      [current_index + move_diff / 2, target_index]
    elsif move_diff == 8 * player_direction
      [target_index]
    elsif move_diff == 7 * player_direction || move_diff == 9 * player_direction
      "Capture"
    else
      []
    end
  end
end
