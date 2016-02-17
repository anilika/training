#14) Given the length L of a circumference, find the radius R and the area S of the circle.
# Take into account that L = 2·π·R, S = π·R2. Use 3.14 for a value of π.
#15) Given the area S of a circle, find the diameter D and the length L of the circumference.
# Take into account that L = π·D, S = π·D2/4. Use 3.14 for a value of π.

class Circle
  include Math
  Pi = PI.round(2)

  def initialize
    @radius = 0.0
    @diameter = 0.0
  end

  def find_radius(circumference)
   @radius = (circumference / 2 * Pi).round(2)
  end

  def find_area
    (Pi * (@radius ** 2)).round(2)
  end

  def find_diameter(area)
    @diameter = (((area * 4) / Pi) * 0.5).round(2)
  end

  def find_circumference
    (@diameter * Pi).round(2)
  end
end

my_circumference = Circle.new
puts "my radius is #{my_circumference.find_radius(24)}"
puts "my area is #{my_circumference.find_area}"

my_area = Circle.new
puts "my diametr is #{my_area.find_diameter(16)}"
puts "my circumference is #{my_area.find_circumference}"
