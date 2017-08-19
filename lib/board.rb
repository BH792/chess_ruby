class ChessBoard
  attr_reader :board
  # 1 pawn
  # 2 knight
  # 3 bishop
  # 4 rook
  # 5 queen
  # 6 king
  # negative - black
  # positive - white

  def initialize
    @board = Array.new(64, 0)

    # place pawns
    for i in (8..15)
      @board[i] = -1
    end
    for i in (48..55)
      @board[i] = 1
    end

    # place other pieces
    black = [-4, -2, -3, -5, -6, -3, -2, -4]
    white = [4, 2, 3, 5, 6, 3, 2, 4]
    for i in (0..7)
      @board[i] = black.shift
    end
    for i in (56..63)
      @board[i] = white.shift
    end
  end

  def move(coords)
    if validate_move(coords)
      @board[coords[1]] = @board[coords[0]]
      @board[coords[0]] = 0
    end
  end

  def validate_move(coords)
    validate_piece(coords)
  end

  def validate_piece

  end
end
