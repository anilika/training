#7) Given the radius R of a circle, find the length L of the circumference and the area S of the circle: L = 2·π·R, S = π·R2.

class Circle
  include Math

  Pi = PI.round(2)

  def initialize(radius)
    @radius = radius.to_f
  end

  def area
    Pi * (@radius ** 2)
  end

  def circumference
    2 * Pi * @radius
  end
end

my_circle = Circle.new(4)
puts my_circle.area
puts my_circle.circumference
