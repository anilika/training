#1) Given the side a of a square, find the perimeter P of the square: P = 4·a
#2) Given the side a of a square, find the area S of the square: S = a2.
#3) Given the edge a of a cube, find the volume V = a3 and the surface area S = 6·a2 of the cube.

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
