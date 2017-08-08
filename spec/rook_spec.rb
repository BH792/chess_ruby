require_relative "../lib/pieces/rook"

describe Rook do
  test_rook = Rook.new("black")

  describe "move_trace" do
    context "returns array with steps when given index values of a valid move" do
      it "5 square up" do
        expect(test_rook.move_trace(56, 16)).to eq([48, 40, 32, 24, 16])
      end

      it "4 square right" do
        expect(test_rook.move_trace(0, 4)).to eq([1, 2, 3, 4])
      end

      it "3 square down" do
        expect(test_rook.move_trace(7, 31)).to eq([15, 23, 31])
      end

      it "1 square left" do
        expect(test_rook.move_trace(63, 62)).to eq([62])
      end
    end

    context "given index values of an invalid move" do
      it "returns empty array" do
        expect(test_rook.move_trace(0, 9)).to eq([])
      end
    end
  end
end
