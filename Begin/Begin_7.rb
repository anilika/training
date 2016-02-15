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
