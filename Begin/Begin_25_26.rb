#25) Given an independent variable x, find the value of a function y = 3x6 − 6x2 − 7.
#26) Given an independent variable x, find the value of a function y = 4(x−3)6 − 7(x−3)3 + 2.

class Functions
  def initialize(variable_x)
    @x = variable_x
  end

  def first_function
    3 * (@x ** 6) - 6 * (@x ** 2) - 7
  end

  def second_function
    4 * ((@x - 3) ** 6) - 7 * ((@x - 3) ** 3) + 2
  end
end

my_decision = Functions.new(5)
puts "task begin_25 result: #{my_decision.first_function}"
puts "task begin_26 result: #{my_decision.second_function}"