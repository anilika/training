#3) The sides a and b of a rectangle are given. Find the area S = a·b and the perimeter P = 2·(a + b) of the rectangle.
#6) The edges a, b, c of a right parallelepiped are given. Find the volume V = a·b·c and the surface area S = 2·(a·b + b·c + a·c) of the right parallelepiped.

class Rectangle
  def initialize(*sides)
    @side_1, @side_2 = sides[0].to_f, sides[1].to_f
  end

  def area
    (@side_1 + @side_2) * 2
  end

  def perimeter
    (@side_1 + @side_2) * 2
  end
end

class Parallelepiped < Rectangle
  def initialize(*sides)
    @side_1, @side_2, @side_3 = sides[0].to_f, sides[1].to_f, sides[2].to_f
  end

  def volume
    area * @side_3
  end

  def surface_area
    (area + (@side_2 * @side_3) + (@side_1 * @side_3)) * 2
  end
end

my_rectangle = Rectangle.new(2, 6)
puts my_rectangle.area
puts my_rectangle.perimeter

my_parallelepiped = Parallelepiped.new(2, 4, 3)
puts my_parallelepiped.volume
puts my_parallelepiped.surface_area