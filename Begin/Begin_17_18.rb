#17) Three points A, B, C are given on the real axis. Find the length of AC, the length of BC, and the sum of these lengths.
#18) Three points A, B, C are given on the real axis, the point C is located between the points A and B.
# Find the product of the length of AC and the length of BC.

class RealAxis
  def initialize(a, b, c)
    @point_a = a.to_i
    @point_b = b.to_i
    @point_c = c.to_i
  end

  def len_segment_ac
    (@point_c - @point_a).abs
  end

  def len_segment_bc
    (@point_c - @point_b).abs
  end

  def sum_len_ac_bc
    len_segment_ac + len_segment_bc
  end

  def product_len_ac_bc
    len_segment_ac * len_segment_bc
  end
end

my_points = RealAxis.new(-1, 4, 2)
puts "length AC is #{my_points.len_segment_ac}"
puts "length BC is #{my_points.len_segment_bc}"
puts "sum AC and BC is #{my_points.sum_len_ac_bc}"
puts "product of the length AB and length BC is #{my_points.product_len_ac_bc}"



