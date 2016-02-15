module SiPrefix
  def senti
    10 ** -2
  end

  def kilo
    10 ** 3
  end

  def tonna
    10 ** -6
  end

  def kilobyte
    2 ** 10
  end
end

class UnitConverter
  include SiPrefix

  def centimeters_in_meters(numb)
    numb.to_f * senti
  end

  def kilogramm_in_tona(numb)
    (numb.to_f * kilo) * tonna
  end

  def kilobyte_in_byte(numb)
    numb.to_i * kilobyte
  end
end

my_converter = UnitConverter.new
puts my_converter.centimeters_in_meters(10).round(2)
puts my_converter.kilogramm_in_tona(100).round(2)
puts my_converter.kilobyte_in_byte(2)
