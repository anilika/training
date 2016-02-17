#23) Variables A, B, C are given. Change values of the variables by moving the given value of A into the variable B,
# the given value of B into the variable C, and the given value of C into the variable A. Output the new values of A, B, C.
#24) Variables A, B, C are given. Change values of the variables by moving the given value of A into the variable C,
# the given value of C into the variable B, and the given value of B into the variable A. Output the new values of A, B, C.

class Variables
  attr_reader :a, :b, :c

  def initialize(a, b, c)
    @a, @b, @c = a, b, c
  end

  def swap_values_b23
    @b, @c, @a = @a, @b, @c
  end

  def swap_values_b24
    @c, @b, @a = @a, @c, @b
  end
end

my_variables_b23 = Variables.new(2, 14, 8)
my_variables_b23.swap_values_b23
puts "changed variables are = #{my_variables_b23.a}, b = #{my_variables_b23.b}, c = #{my_variables_b23.c}"

my_variables_b24 = Variables.new(23, 11, 7)
my_variables_b24.swap_values_b24
puts "changed variables are = #{my_variables_b24.a}, b = #{my_variables_b24.b}, c = #{my_variables_b24.c}"