class Circle
  include Math

  def self.circumference(diameter)
    puts diameter.to_f * PI.round(2)
  end
end

Circle.circumference(4)
