module OutputData
  def print_num(num)
    puts "Your number is #{num}."
  end

  def print_ones_digit(ones)
    puts "It's ones digit is #{ones}."
    puts
  end

  def print_tens_digit(tens)
    puts "It's tens digit is #{tens}."
  end

  def print_hundreds_digit(hundreds)
    puts "It's hundreds digit is #{hundreds}."
  end

  def print_swap_digits(num, swap_number)
    print_num(num)
    puts "It's swapped digits #{swap_number}."
    puts
  end

  def print_sum_and_product(num, sum, product)
    print_num(num)
    puts "Product numerals is #{product}"
    puts "Summ numerals is #{sum}"
    puts
  end
end

class Calculating
  include OutputData

  def sum_numeral_num(num)
    sum_numeral = 0
    num.to_s.each_char do |numeral|
      sum_numeral += numeral.to_i
    end
    sum_numeral
  end

  def product_numeral_num(num)
    product_numeral = 1
    num.to_s.each_char do |numeral|
      product_numeral *= numeral.to_i
    end
    product_numeral
  end

  def get_hundreds_digits(num)
    (num.to_i % 1000) / 100
  end

  def get_tens_digit(num)
    (num.to_i % 100) / 10
  end

  def get_ones_digit(num)
    num.to_i % 10
  end

  def sum_and_product(num)
    sum, product = sum_numeral_num(num), product_numeral_num(num)
    print_sum_and_product(num, sum, product)
  end
end

class TwoDigit < Calculating
  def set_tens_ones_digit(num)
    left_numeral, right_numeral = get_tens_digit(num), get_ones_digit(num)
    print_num(num)
    print_tens_digit(left_numeral)
    print_ones_digit(right_numeral)
  end

  def swap_digits(num)
    first_numeral, last_numeral = get_tens_digit(num), get_ones_digit(num)
    swap_number = "#{last_numeral}#{first_numeral}".to_i
    print_swap_digits(num, swap_number)
  end
end

class ThreeDigit < Calculating
  def set_left_middle_right_digit(num)
    hundreds, tens, ones = get_hundreds_digits(num), get_tens_digit(num), get_ones_digit(num)
    print_num(num)
    print_hundreds_digit(hundreds)
    print_tens_digit(tens)
    print_ones_digit(ones)
  end
end

my_two_digit = TwoDigit.new
my_two_digit.set_tens_ones_digit(65)
my_two_digit.sum_and_product(44)
my_two_digit.swap_digits(28)

my_three_digit = ThreeDigit.new
my_three_digit.set_left_middle_right_digit(639)
my_three_digit.sum_and_product(512)