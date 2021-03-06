require_relative "../config/environment.rb"
# 1 pawn
# 2 knight
# 3 bishop
# 4 rook
# 5 queen
# 6 king
# negative - black
# positive - white

class Board
  attr_accessor :board

  def new_chessboard
    @board = Array.new(64,0)
    black_pieces = [
      Rook.new("black", self), Knight.new("black", self), Bishop.new("black", self),
      Queen.new("black", self), King.new("black", self), Bishop.new("black", self),
      Knight.new("black", self), Rook.new("black", self)
    ]
    white_pieces = [
      Rook.new("white", self), Knight.new("white", self), Bishop.new("white", self),
      Queen.new("white", self), King.new("white", self), Bishop.new("white", self),
      Knight.new("white", self), Rook.new("white", self)
    ]
    for i in 0..7 do
      @board[i] = black_pieces.shift
    end

    for i in 56..63 do
      @board[i] = white_pieces.shift
    end

    for i in 8..15 do
      @board[i] = Pawn.new("black", self)
    end

    for i in 48..55 do
      @board[i] = Pawn.new("white", self)
    end

  end

  def get_board
    @board.map do |square|
      if square.is_a? Pawn
        "#{square.color} pawn"
      elsif square.is_a? Knight
        "#{square.color} knight"
      elsif square.is_a? Bishop
        "#{square.color} bishop"
      elsif square.is_a? Rook
        "#{square.color} rook"
      elsif square.is_a? Queen
        "#{square.color} queen"
      elsif square.is_a? King
        "#{square.color} king"
      else
        ""
      end
    end
  end

  def move(current_index, new_index)
    @board[new_index] = @board[current_index]
    @board[current_index] = 0
  end
end



# board = Board.new
# pp board.board



# def unicode_to_piece_type(unicode)
#   case unicode
#   when "\u2654" || "\u265A"
#
#   white chess king	♔	U+	&#9812;
#   white chess queen	♕	U+2655	&#9813;
#   white chess rook	♖	U+2656	&#9814;
#   white chess bishop	♗	U+2657	&#9815;
#   white chess knight	♘	U+2658	&#9816;
#   white chess pawn	♙	U+2659	&#9817;
#   black chess king	♚	U+	&#9818;
#   black chess queen	♛	U+265B	&#9819;
#   black chess rook	♜	U+265C	&#9820;
#   black chess bishop	♝	U+265D	&#9821;
#   black chess knight	♞	U+265E	&#9822;
#   black chess pawn	♟	U+265F
# end
