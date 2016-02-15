class ConvertTemperature
  def initialize(temperature, scale)
    @t = temperature.to_f
    case scale
    when "C", "c" then puts convert_in_fahrenhiet.to_s + " F"
    when "F", "f" then puts convert_in_celsium.to_s + " C"
    end
  end

  def convert_in_celsium
    ((@t - 32) * 5) / 9
  end

  def convert_in_fahrenhiet
    ((@t * 9) / 5) + 32
  end
end

ConvertTemperature.new(48, "F")


