require "./lib/main"

describe Chess do
  context "#calc_next_pos" do
    n1 = Chess.new
    it "calculates 8 valid positions when available" do
      pos = n1.calc_next_pos([3, 3])
      exp_pos = [[4, 5], [4, 1], [2, 5], [2, 1], [5, 4], [5, 2], [1, 4], [1, 2]]
      expect(pos).to eql(exp_pos)
      expect(pos.size).to eql(8)
    end

    it "calculates 2 valid positions for corner nodes" do
      pos = n1.calc_next_pos([0, 0])
      exp_pos = [[1, 2], [2, 1]]
      expect(pos).to eql(exp_pos)
      expect(pos.size).to eql(2)
    end
  end
end
