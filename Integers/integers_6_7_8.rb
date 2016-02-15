module OutputData
  def print_numb(numb)
    puts "Your numb is #{numb}."
  end

  def print_ones_digit(ones)
    puts "His ones digit is #{ones}."
    puts
  end

  def print_tens_digit(tens)
    puts "His tens digit is #{tens}."
  end

  def print_hundreds(hundreds)
    puts "His hundreds digit is #{hundreds}."
  end

  def print_swap_numeral_numb(numb, swap_nuber)
    print_numb(numb)
    puts "He is swap in #{swap_nuber}."
    puts
  end

  def print_sum_and_product(numb, sum, product)
    print_numb(numb)
    puts "Poduct numerals is #{product}"
    puts "Summ numerals is #{sum}"
    puts
  end
end

class Calculating
  include OutputData

  def sum_numeral_numb(numb)
    sum_numeral = 0
    numb.to_s.each_char do |numeral|
      sum_numeral += numeral.to_i
    end
    sum_numeral
  end

  def product_numeral_numb(numb)
    product_numeral = 1
    numb.to_s.each_char do |numeral|
      product_numeral *= numeral.to_i
    end
    product_numeral
  end

  def get_hundreds_digits(numb)
    (numb.to_i % 1000) / 100
  end

  def get_tens_digit(numb)
    (numb.to_i % 100) / 10
  end

  def get_ones_digit(numb)
    numb.to_i % 10
  end

  def sum_and_product(numb)
    sum, product = sum_numeral_numb(numb), product_numeral_numb(numb)
    print_sum_and_product(numb, sum, product)
  end
end

class TwoDigit < Calculating
  def set_tens_ones_digit(numb)
    left_numeral, right_numeral = get_tens_digit(numb), get_ones_digit(numb)
    print_numb(numb)
    print_tens_digit(left_numeral)
    print_ones_digit(right_numeral)
  end

  def swap_numeral_numer(numb)
    first_numeral, last_numeral = get_tens_digit(numb), get_ones_digit(numb)
    swap_nuber = "#{last_numeral}#{first_numeral}".to_i
    print_swap_numeral_numb(numb, swap_nuber)
  end
end

class ThreeDigit < Calculating
  def set_left_middle_right_digit(numb)
    hundreds, tens, ones = get_hundreds_digits(numb), get_tens_digit(numb), get_ones_digit(numb)
    print_numb(numb)
    print_hundreds(hundreds)
    print_tens_digit(tens)
    print_ones_digit(ones)
  end
end

my_two_digit = TwoDigit.new
my_two_digit.set_tens_ones_digit(65)
my_two_digit.sum_and_product(44)
my_two_digit.swap_numeral_numer(28)

my_three_digit = ThreeDigit.new
my_three_digit.set_left_middle_right_digit(639)
my_three_digit.sum_and_product(512)