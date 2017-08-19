class Console
  attr_accessor :board

  def initialize(board = nil)
    board ? @board = board : @board = ChessBoard.new
  end

  def print
    board_str = "  ---------------------------------\n 1"
    for i in 0..63 do
      board_str += "| #{to_unicode(@board.board[i])} "
      if (i + 1) % 8 == 0
        board_str += "|\n  ---------------------------------\n"
        if i < 56
          board_str += " #{(i + 1) / 8 + 1}"
        end
      end
    end
    puts "    A   B   C   D   E   F   G   H  "
    puts board_str
  end

  def to_unicode(piece_code)
    case piece_code
    when 1
      "\u2659"
    when 2
      "\u2658"
    when 3
      "\u2657"
    when 4
      "\u2656"
    when 5
      "\u2655"
    when 6
      "\u2654"
    when -1
      "\u265F"
    when -2
      "\u265E"
    when -3
      "\u265D"
    when -4
      "\u265C"
    when -5
      "\u265B"
    when -6
      "\u265A"
    else
      " "
    end
  end

  def coord_to_index(coord)
    # turns coordinates in the form of A2, G7 into
    # the equivalent index of the board array
    index = case coord[0].downcase
    when "a"
      0
    when "b"
      1
    when "c"
      2
    when "d"
      3
    when "e"
      4
    when "f"
      5
    when "g"
      6
    when "h"
      7
    end

    index += (coord[1].to_i - 1) * 8
  end

  def move_to_indexes(raw_move)
    raw_coords = raw_move.split
    raw_coords.map { |coord| coord_to_index(coord) }
  end

  def get_valid_move_coords
    puts "Please enter a valid move or enter 'help' for more info"
    # binding.pry
    raw_move = gets.chomp
    if raw_move.downcase == "help" || raw_move.downcase == "h"
      move_help
    elsif is_move_valid?(raw_move)
      @board.move(move_to_indexes(raw_move))
    else
      nil
    end
  end

  def is_move_valid?(raw_user_move)
    raw_coords = raw_user_move.split
    raw_coords.length == 2 && raw_coords.all? { |coord| is_coord_valid?(coord) }
  end

  def is_coord_valid?(coord)
    (coord.length == 2 &&
    coord[0].downcase <= "h" && coord[0].downcase >= "a" &&
    coord[1].to_i <= 8 && coord[1].to_i >= 1)
  end

  def move_help
    puts "Move format:        A48 A40"
    puts "       ______________|    |__________ "
    puts "      |                              |"
    puts "Current Piece Coordinate         Target Coordinate"
    get_valid_move_coords
  end
end
