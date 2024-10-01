def calc_next_pos(loc)
  x1 = [loc[0] + 1, loc[0] - 1]
  x2 = [loc[0] + 2, loc[0] - 2]
  y1 = [loc[1] + 1, loc[1] - 1]
  y2 = [loc[1] + 2, loc[1] - 2]
  pos = []
  pos.append(x1.product(y2).filter do |xy|
    (0...8).include?(xy[0]) and (0...8).include?(xy[1])
  end).flatten.each_slice(2).to_a
  pos.append(x2.product(y1).filter do |xy|
    (0...8).include?(xy[0]) and (0...8).include?(xy[1])
  end).flatten.each_slice(2).to_a
end

p calc_next_pos([2, 3])
