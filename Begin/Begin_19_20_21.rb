#19) The coordinates (x1, y1) and (x2, y2) of two opposite vertices of a rectangle are given. Sides of the rectangle are parallel to coordinate axes.
# Find the perimeter and the area of the rectangle.
#20) The coordinates (x1, y1) and (x2, y2) of two points are given. Find the distance between the points: ((x2 − x1)2 + (y2 − y1)2)1/2.
#21) The coordinates (x1, y1), (x2, y2), (x3, y3) of the triangle vertices are given.
# Find the perimeter and the area of the triangle using the formula for distance between two points in the plane (see Begin20).
# The area of a triangle with sides a, b, c can be found by Heron formula: S = (p·(p − a)·(p − b)·(p − c))1/2,

class Coordinates
  def length_segment(coordinate_point_one, coordinate_point_two)
    (coordinate_point_two - coordinate_point_one).abs
  end

  def length_between_points(x_1, y_1, x_2, y_2)
    ((length_segment(x_1, x_2) ** 2) + (length_segment(y_1, y_2) ** 2)) ** 0.5
  end
end

class Rectangle < Coordinates
  def initialize(one_point, two_point)
    @x1, @y1 = one_point
    @x2, @y2 = two_point
    length_segments
  end

  def length_segments
    @segment_x, @segment_y = length_segment(@x1, @x2), length_segment(@y1, @y2)
  end

  def area
    @segment_x * @segment_y
  end

  def perimeter
    (@segment_x + @segment_y) * 2
  end
end

class LineSegment < Coordinates
  def initialize(one_point, two_point)
    @x1, @y1 = one_point
    @x2, @y2 = two_point
  end

  def size_x_y_segment
    length_between_points(@x1, @y1, @x2, @y2)
  end
end

class Triangle < Coordinates
  def initialize(one_point, two_point, three_point)
    @x1, @y1 = one_point
    @x2, @y2 = two_point
    @x3, @y3 = three_point
    find_length_segments
  end

  def find_length_segments
    @segment_a = length_between_points(@x1, @y1, @x2, @y2)
    @segment_b = length_between_points(@x2, @y2, @x3, @y3)
    @segment_c = length_between_points(@x1, @y1, @x3, @y3)
  end

  def perimeter
    @segment_a + @segment_b + @segment_c
  end

  def half_perimeter
    perimeter / 2
  end

  def area_of_triangle
    (half_perimeter * (half_perimeter - @segment_a) * (half_perimeter - @segment_b) * (half_perimeter - @segment_c)) ** 0.5
  end
end

my_rectangle = Rectangle.new([2, 8], [6, 1])
puts "area is #{my_rectangle.area}"
puts "perimeter is #{my_rectangle.perimeter}"

my_line_segment = LineSegment.new([2, 7], [5, 3])
puts "distance between points is #{my_line_segment.size_x_y_segment}"

my_triangle = Triangle.new([2, 2], [1, 8], [6, 1])
puts "perimeter of triangle is #{my_triangle.perimeter.round(2)}"
puts "area of triangle is #{my_triangle.area_of_triangle.round(2)}"
