require "./lib/main"

context "#calc_next_pos" do
  it "calculates 8 valid positions when available" do
    pos = calc_next_pos([3, 3])
    exp_pos = [[4, 5], [4, 1], [2, 5], [2, 1], [5, 4], [5, 2], [1, 4], [1, 2]]
    expect(pos).to eql(exp_pos)
    expect(pos.size).to eql(8)
  end

  it "calculates 2 valid positions for corner nodes" do
    pos = calc_next_pos([0, 0])
    exp_pos = [[1, 2], [2, 1]]
    expect(pos).to eql(exp_pos)
    expect(pos.size).to eql(2)
  end
end

context "#calc_dist" do
  it "returns the euclidean distance between two points" do
    expect(calc_dist([0, 0], [1, 1])).to eql(Math.sqrt(2))
    expect(calc_dist([2, 2], [1, 1])).to eql(Math.sqrt(2))
    expect(calc_dist([2, 2], [0, 0])).to eql(Math.sqrt(8))
    expect(calc_dist([0, 0], [0, 0])).to eql(Math.sqrt(0))
  end
end
