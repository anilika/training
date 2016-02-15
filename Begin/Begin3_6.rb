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