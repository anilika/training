#8) Given two numbers a and b, find their average: (a + b)/2.
#9) Given two nonnegative numbers a and b, find their geometrical mean (a square root of their product): (a·b)**1/2.
#10) Two nonzero numbers are given. Find the sum, the difference, the product, and the quotient of their squares.
#11) Two nonzero numbers are given. Find the sum, the difference, the product, and the quotient of their absolute values.
#12) The legs a and b of a right triangle are given. Find the hypotenuse c and the perimeter P of the triangle: c = (a2 + b2)1/2, P = a + b + c.
#13) Given the radiuses R1 and R2 of two concentric circles (R1 > R2), find the areas S1 and S2 of the circles and the area S3 of the ring bounded by the circles:
#                 S1 = π·(R1)2,        S2 = π·(R2)2,        S3 = S1 − S2.


class TwoNumbers
  def initialize(num_one, num_two)
    @num_one = num_one.to_f
    @num_two = num_two.to_f
  end

  def sum_nums
    @num_one + @num_two
  end

  def num_difference
    @num_one - @num_two
  end

  def product
    @num_one * @num_two
  end

  def quotient
    @num_one / @num_two
  end
end

class AverageSums < TwoNumbers
  def average
    sum_nums / 2
  end

  def geometrical_mean
    product ** 0.5
  end
end

class Squares < TwoNumbers
  def in_square
    @num_one = @num_one ** 2
    @num_two = @num_two ** 2
  end
end

class AbsoluteValues < TwoNumbers
   def in_module
    @num_one = @num_one.abs
    @num_two = @num_two.abs
  end
end

class Triangle < TwoNumbers
  def hypotenuse
    (@num_one **2 + @num_two **2) ** 0.5
  end

  def perimeter
    sum_nums + hypotenuse
  end
end

class ConcentricCircles < Squares
  include Math

  def area_1
    @area_1 = PI * @num_one
  end

  def area_2
    @area_2 = PI * @num_two
  end

  def area_3
    @area_3 = @area_1 - @area_2
  end
end

my_numbers = AverageSums.new(2, 8)
puts my_numbers.average
puts my_numbers.geometrical_mean

my_square = Squares.new(3, 6)
my_square.in_square
puts my_square.sum_nums
puts my_square.num_difference
puts my_square.product
puts my_square.quotient

my_module = AbsoluteValues.new(-6, 12)
my_module.in_module
puts my_module.sum_nums
puts my_module.num_difference
puts my_module.product
puts my_module.quotient

my_triangle = Triangle.new(3, 7)
puts my_triangle.hypotenuse
puts my_triangle.perimeter

my_circles = ConcentricCircles.new(10, 4)
my_circles.in_square
puts my_circles.area_1
puts my_circles.area_2
puts my_circles.area_3