require "spec_helper"

describe "Rook" do
  board = Board.new
  board.board = Array.new(64, 0)

  context "valid_moves_rook" do
    it "returns array of all valid moves" do
      test_rook = Rook.new("black", board).tap { |this| board.board[17] = this }
      expect(test_rook.ortho_valid_moves).to eq([1, 9, 16, 18, 19, 20, 21, 22, 23, 25, 33, 41, 49, 57])
    end

    it "returns array of all valid moves when partially blocked" do
      Rook.new("black", board).tap { |this| board.board[25] = this }
      test_rook = Rook.new("black", board).tap { |this| board.board[17] = this }
      expect(test_rook.ortho_valid_moves).to eq([1, 9, 16, 18, 19, 20, 21, 22, 23])
    end
  end
end
