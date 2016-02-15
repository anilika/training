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