module OutputData
  def print_num(num)
    puts "\nYour number is #{num}."
  end

  def print_ones_digit(ones)
    puts "It's ones digit is #{ones}."
  end

  def print_tens_digit(tens)
    puts "It's tens digit is #{tens}."
  end

  def print_hundreds_digit(hundreds)
    puts "It's hundreds digit is #{hundreds}."
  end

  def print_thousands_digit(thousands)
    puts "It's thousands digit is #{thousands}"
  end

  def print_reverse_num(reverse_num)
    puts "It's reversed digits #{reverse_num}."
  end

  def print_sum_digits(sum)
    puts "Summ numerals is #{sum}."
  end

  def print_product_digits(product)
    puts "Product numerals is #{product}."
  end

  def print_move_left(num_move)
    puts "Number move left is #{num_move}."
  end

  def print_move_right(num_move)
    puts "Number move right is #{num_move}."
  end

  def print_exchange_tens_hundreds(exchange_num)
    puts "Number wish exchange a tens digit and a hundreds digit is #{exchange_num}"
  end

  def print_exchange_ones_tens(exchange_num)
    puts "Number wish exchange a ones digit and a tens digit is #{exchange_num}"
  end
end

class Calculating
  include OutputData
  attr_reader :num

  def initialize(num)
    @num = num.to_s
    print_num(@num)
  end

  def get_sum_digits
    sum_digits = 0
    num.each_char do |digit|
      sum_digits += digit.to_i
    end
    print_sum_digits(sum_digits)
  end

  def get_product_digits
    product_digits = 1
    num.each_char do |digit|
      product_digits *= digit.to_i
    end
    print_product_digits(product_digits)
  end

  def get_hundreds_digits
    print_hundreds_digit((num.to_i % 1000) / 100)
  end

  def get_tens_digit
    print_tens_digit((num.to_i % 100) / 10)
  end

  def get_ones_digit
    print_ones_digit(num.to_i % 10)
  end

  def get_reverse_num
    print_reverse_num(num.reverse)
  end
end

class TwoDigit < Calculating
end

class ThreeDigit < Calculating
  def get_move_left
    print_move_left(num[1..-1] + num[0])
  end

  def get_move_right
    print_move_right(num[-1] + num[0...-1])
  end

  def exchange_tens_hundreds
    print_exchange_tens_hundreds(num[1] + num[0] + num[-1])
  end

  def exchange_ones_tens
    print_exchange_ones_tens(num[0] + num[-1] + num[1])
  end
end

class Greater999Digit < Calculating
  def get_thousands
    print_thousands_digit((num.to_i % 10000) / 1000)
  end
end

my_two_digit = TwoDigit.new(65)
my_two_digit.get_tens_digit
my_two_digit.get_ones_digit
my_two_digit.get_sum_digits
my_two_digit.get_product_digits
my_two_digit.get_reverse_num

my_three_digit = ThreeDigit.new(512)
my_three_digit.get_hundreds_digits
my_three_digit.get_tens_digit
my_three_digit.get_ones_digit
my_three_digit.get_sum_digits
my_three_digit.get_product_digits
my_three_digit.get_reverse_num
my_three_digit.get_move_left
my_three_digit.get_move_right
my_three_digit.exchange_tens_hundreds
my_three_digit.exchange_ones_tens

my_big_num = Greater999Digit.new(65784)
my_big_num.get_hundreds_digits
my_big_num.get_thousands