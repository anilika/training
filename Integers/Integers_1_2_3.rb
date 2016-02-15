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
