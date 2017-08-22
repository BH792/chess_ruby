module King
  include Piece

  def king_move_validation(coords)
    move_diff = coords[0] - coords[1]

    if [1, 8, 7, 9].include?(move_diff.abs)
      if !same_color?(coords)
        if @board[coords[0]] > 0
          white_castle_false
        elsif @board[coords[0]] < 0
          black_castle_false
        end
        true
      end
    elsif castle?(coords)
      true
    end
  end

  def castle_spaces_empty?(coords)
    @board[coords[1]] == 0 && @board[(coords.sum / 2)] == 0
  end

  def castle?(coords)
    if castle_spaces_empty?(coords) &&
      !is_check?(black_or_white?(coords), coords[1]) &&
      !is_check?(black_or_white?(coords), coords.sum / 2)
      if coords[1] == 6 && @black_king_side_castling
        force_move([7,5])
      elsif coords[1] == 2 && @black_queen_side_castling
        @board[1] == 0 ? force_move([0,3]) : false
      elsif coords[1] == 62 && @white_king_side_castling
        @board[1] == 0 ? force_move([63,61]) : false
      elsif coords[1] == 58 && @white_queen_side_castling
        force_move([56,59])
      end
    end
  end

  def black_castle_false
    @black_king_side_castling = false
    @black_queen_side_castling = false
  end

  def white_castle_false
    @white_king_side_castling = false
    @white_queen_side_castling = false
  end

  def index_of_king(black_or_white)
    if black_or_white > 0
      @board.index(6)
    elsif black_or_white < 0
      @board.index(-6)
    end
  end

  def black_or_white?(coords)
    @board[coords[0]] > 0 ? 1 : -1
  end

  def is_check?(black_or_white, king_index)
    old_board = @board.dup
    @board[king_index] = 6 * black_or_white
    index_triggering_true = 0
    in_check = false
    @board.each_with_index do |piece, index|
      if validate_piece([index, king_index])
        in_check = true
        index_triggering_true = index
      end
    end
    @board = old_board
    in_check
  end

  def is_checkmate?
    check_mate = false
    black_king_index = nil
    white_king_index = nil
    @board.each do |x|
      if x == 6
        white_king_index = @board.index(x)
      elsif x == -6
        black_king_index = @board.index(x)
      end
    end

    if is_check?(-1, black_king_index)
      possible_moves = possible_moves(black_king_index)
      check_mate = possible_moves.all? do |move|
        is_check?(-1, move)
      end
    end

    if is_check?(1, white_king_index)
      possible_moves = possible_moves(black_king_index)
      check_mate = possible_moves.all? do |move|
        is_check?(1, move)
      end
    end

    check_mate
  end

  def possible_moves(king_index)
    possible_indexes = []
    if (king_index + 1) / 8 == king_index / 8
      possible_indexes << king_index + 1 if @board[king_index + 1] == 0
    end
    if (king_index - 1) / 8 == king_index / 8
      possible_indexes << king_index - 1 if @board[king_index - 1] == 0
    end
    if king_index + 8 >= 0 && king_index + 8 <= 63
      possible_indexes << king_index + 8 if @board[king_index + 8] == 0
    end
    if king_index - 8 >= 0 && king_index - 8 <= 63
      possible_indexes << king_index - 8 if @board[king_index - 8] == 0
    end
    if king_index % 8 > 0 && king_index / 8 > 0
      possible_indexes << king_index - 9 if @board[king_index - 9] == 0
    end
    if king_index % 8 < 7 && king_index / 8 > 0
      possible_indexes << king_index - 7 if @board[king_index - 7] == 0
    end
    if king_index % 8 > 0 && king_index / 8 < 7
      possible_indexes << king_index + 7 if @board[king_index + 7] == 0
    end
    if king_index % 8 < 7 && king_index / 8 < 7
      possible_indexes << king_index - 9 if @board[king_index - 9] == 0
    end
    possible_indexes
  end
end
