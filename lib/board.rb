class ChessBoard
  include Bishop, Knight, Rook, Queen, Pawn, King
  attr_accessor :board, :black_king_side_castling, :white_king_side_castling, :black_queen_side_castling, :white_queen_side_castling, :last_move
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
    @black_king_side_castling = true
    @white_king_side_castling = true
    @black_queen_side_castling = true
    @white_queen_side_castling = true
    @last_move = [64,64]

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
    if validate_piece(coords)
      @board[coords[1]] = @board[coords[0]]
      @board[coords[0]] = 0
      @last_move = coords
    else
      puts "Invalid Move"
    end
  end

  def force_move(coords)
    @board[coords[1]] = @board[coords[0]]
    @board[coords[0]] = 0
  end

  def validate_piece(coords)
    case @board[coords[0]]
    when 0
      false
    when 1, -1
      pawn_move_validation(coords)
    when 2, -2
      knight_move_validation(coords)
    when 3, -3
      bishop_move_validation(coords)
    when 4, -4
      rook_move_validation(coords)
    when 5, -5
      queen_move_validation(coords)
    when 6, -6
      king_move_validation(coords)
    end
  end
end
