class Piece
  attr_reader :has_moved
  attr_reader :color

  def initialize(color)
    @color = color
    @has_moved = false
  end

  def move_trace(current_index,target_index)
    []
  end

  def moved
    @has_moved = true
  end
end
