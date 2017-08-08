require "console"
require "board"

describe Console do
  test_console = Console.new
  console_input = StringIO.new("A1     b1   \nh8 g8\n")
  # test_board = Board.new

  describe "print" do
    context "prints the current board status with correct unicode [PENDING]" do
      it "works with new game board" do
      end
    end
  end

  describe "move validation" do
    context "#is_coord_valid?" do
      it "correctly identifies valid & invalid coordinates" do
        expect(test_console.is_coord_valid?("a2")).to eq(true)
        expect(test_console.is_coord_valid?("A2")).to eq(true)
        expect(test_console.is_coord_valid?("h8")).to eq(true)
        expect(test_console.is_coord_valid?("")).to eq(false)
        expect(test_console.is_coord_valid?("a2a2")).to eq(false)
        expect(test_console.is_coord_valid?("i1")).to eq(false)
        expect(test_console.is_coord_valid?("a9")).to eq(false)
      end
    end

    context "#is_move_valid?" do
      it "correctly identifies validates raw user move input" do
        expect(test_console.is_move_valid?("a8 a2")).to eq(true)
        expect(test_console.is_move_valid?("g1 b2")).to eq(true)
        expect(test_console.is_move_valid?("a8a2")).to eq(false)
        expect(test_console.is_move_valid?("a8 a2 a3")).to eq(false)
      end
    end
  end

  describe "converting move to index values" do
    it "converts coordinate into the correct index" do
      expect(test_console.coord_to_index("a1")).to eq(0)
      expect(test_console.coord_to_index("h8")).to eq(63)
      expect(test_console.coord_to_index("c6")).to eq(42)
    end

    it "converts move into an array of indexes" do
      expect(test_console.move_to_indexes("a1 A2")).to eq([0, 8])
      expect(test_console.move_to_indexes("h8 g8")).to eq([63, 62])
      expect(test_console.move_to_indexes("c6 g4")).to eq([42, 30])
    end
  end

  describe "get_valid_move_coords" do
    it "returns correct index values when given input" do
      # expect(test_console.get_valid_move_coords).to eq([0, 1])
    end
  end
end
