module Pawn
include Piece
  def pawn_move_validation(coords)
    move_diff = coords[0] - coords[1]
    player_direction = white_or_black(coords[0])
    has_not_moved = (player_direction < 0 && coords[0] / 8 == 1) ||
                    (player_direction > 0 && coords[0] / 8 == 6)

    if en_passant?(coords)
      @board[@last_move[1]] = 0
      true
    elsif move_diff == 16 * player_direction && has_not_moved
      @board[coords[0] - move_diff / 2] == 0 && !same_color?(coords)
    elsif move_diff == 8 * player_direction
      !same_color?(coords)
    elsif move_diff == 7 * player_direction || move_diff == 9 * player_direction
      @board[coords[1]] != 0 && !same_color?(coords)
    else
      false
    end
  end

  def en_passant?(coords)
    if @board[@last_move[1]] == @board[coords[0]] * -1
      coords[1] == @last_move.sum / 2
    end
  end

  def promotion

  end
end
