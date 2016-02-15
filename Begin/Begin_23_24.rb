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