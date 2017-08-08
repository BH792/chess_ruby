require "knight"

describe Knight do
  test_knight = Knight.new("black")

  describe "move_trace" do
    context "returns index value for valid move" do
    # up-left, up-right, down-left, down-right" do
      it "up-left" do
        expect(test_knight.move_trace(57, 40)). to eq([40])
      end

      it "up-right" do
        expect(test_knight.move_trace(62, 47)). to eq([47])
      end

      it "down-left" do
        expect(test_knight.move_trace(1, 16)). to eq([16])
      end

      it "down-right" do
        expect(test_knight.move_trace(6, 23)). to eq([23])
      end

      it "right-up" do
        expect(test_knight.move_trace(40, 34)). to eq([34])
      end

      it "right-down" do
        expect(test_knight.move_trace(16, 26)). to eq([26])
      end

      it "left-up" do
        expect(test_knight.move_trace(47, 37)). to eq([37])
      end

      it "left-down" do
        expect(test_knight.move_trace(23, 29)). to eq([29])
      end
    end

    context "give index values corresponding to invalid moves" do
      it "returns an empty array" do
        expect(test_knight.move_trace(1, 15)).to eq([])
      end
    end
  end
end
