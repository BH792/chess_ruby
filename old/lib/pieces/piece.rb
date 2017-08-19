class Piece
  attr_reader :has_moved, :color, :board

  ALL = []

  def initialize(color, board)
    @color = color
    @has_moved = false
    ALL << self
    @board = board
  end

  def move_trace(current_index,target_index)
    []
  end

  def moved
    @has_moved = true
  end

  def index_self
    self.board.board.index(self)
  end
end
