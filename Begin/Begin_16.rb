class RealAxis
  def self.distance_between_points(point_1, point_2)
    (point_2.to_i - point_1.to_i).abs
  end
end

puts RealAxis.distance_between_points(-6, -1)