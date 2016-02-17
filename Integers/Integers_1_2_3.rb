module SIPrefix
  def centi
    100
  end

  def ton
    1000
  end

  def kilobyte
      1024
  end
end

#1)  A distance L is given in centimeters.
# Find the amount of full meters of this distance (1 m = 1000 cm).
# Use the operator of integer division.
#2) A weight M is given in kilograms.
# Find the amount of full tons of this weight (1 ton = 1000 kg).
# Use the operator of integer division.
#3) A file size is given in bytes.
# Find the amount of full Kbytes of this size (1 K = 1024 bytes).
# Use the operator of integer division.

class UnitConverter
  include SIPrefix

  def centimeters_in_meters(num)
    num.to_i / centi
  end

  def kilogramm_in_ton(num)
    num.to_i /  ton
  end

  def kilobyte_in_byte(num)
    num.to_i / kilobyte
  end
end

my_converter = UnitConverter.new
puts my_converter.centimeters_in_meters(0)
puts my_converter.kilogramm_in_ton(0)
puts my_converter.kilobyte_in_byte(0)
