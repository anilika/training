#4) Given the diameter d of a circle, find the length L of the circle: L = π·d. Use 3.14 for a value of π.

class Circle
  include Math

  def self.circumference(diameter)
    puts diameter.to_f * PI.round(2)
  end
end

Circle.circumference(4)
