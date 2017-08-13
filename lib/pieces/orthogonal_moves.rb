module OrthogonalMovement
  def ortho_valid_moves(max_spaces = true, horizontal = true, vertical = true)
    current_pos = self.index_self
    valid_moves = []

    if horizontal
      row = (current_pos / 8)
      if max_spaces
        valid_moves += ((row * 8)..(row * 8 + 7)).to_a
        valid_moves.delete(current_pos)
      else
        valid_moves << current_pos - 1 if (current_pos - 1) >= row * 8
        valid_moves << current_pos + 1 if (current_pos + 1) <= row * 8 + 7
      end
    end

    if vertical
      column = (current_pos % 8)
      if max_spaces
        for i in 0..7
          valid_moves << i * 8 + column
          valid_moves.delete(current_pos)
        end
      else
        valid_moves << current_pos - 8 if current_pos - 8 >= 0
        valid_moves << current_pos + 8 if current_pos + 8 <= 63
      end
    end

    valid_moves.sort
  end
end
