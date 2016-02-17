#16) Two points with the coordinates x1 and x2 are given on the real axis. Find the distance between these points: |x2 − x1|.

class RealAxis
  def self.distance_between_points(point_1, point_2)
    (point_2.to_i - point_1.to_i).abs
  end
end

puts RealAxis.distance_between_points(-6, -1)