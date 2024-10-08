require "pry-byebug"

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

def calc_dist(loc1, loc2)
  Math.sqrt((loc1[0] - loc2[0]).pow(2) + (loc1[1] - loc2[1]).pow(2))
end

# binding.pry
def knight_moves(start, target)
  dist_hash = {}

  dist_to_target = calc_dist(start, target)

  seq = { 0 => start }
  seq_id = 1
  while dist_to_target.positive? && seq_id < 10

    next_pos = calc_next_pos(start)
    dist_hash = {}

    next_pos.each_with_index do |pt, idx|
      dist_hash[idx] = calc_dist(pt, target)
    end

    dist_to_target = dist_hash.values.min
    key_min_dist = dist_hash.key(dist_to_target)

    #    p "is it included? #{seq.values.include?(next_pos[key_min_dist])}"

    if seq.values.include?(next_pos[key_min_dist])
      dist_to_target = dist_hash.values.uniq.min(2)[1]
      key_min_dist = dist_hash.key(dist_to_target)
    end

    # p [next_pos[key_min_dist], dist_hash[key_min_dist]]
    seq[seq_id] = next_pos[key_min_dist]
    start = next_pos[key_min_dist]
    seq_id += 1
    # puts "at the end of #{seq_id}, seq looks like #{seq}"
  end
  seq
end

start = [7, 7]
target = [0, 0]

p knight_moves(start, target)
