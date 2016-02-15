class Square
  def initialize(side)
    @side = side.to_f
  end

  def perimeter
    @side * 4
  end

  def area
    @side ** 2
  end
end

class Cube < Square
  def volume
    area * @side
  end

  def surface_area
    area * 6
  end
end

my_square = Square.new(3)
puts my_square.perimeter
puts my_square.area

my_cube = Cube.new(4)
puts my_cube.volume
puts my_cube.surface_area
