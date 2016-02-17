module SecondsConvert
  attr_reader :seconds
  MINUTE = 60
  HOUR = 3600

  def get_full_minutes
    seconds / MINUTE
  end

  def get_remainder_full_minutes
    seconds % MINUTE
  end

  def get_full_hour
    seconds / HOUR
  end

  def get_remainder_full_hours
    seconds % HOUR
  end
end

module OutputData
  attr_reader :seconds

  def print_minutes_in_passed_seconds(min)
    puts "#{min} of full minutes passed from the beginning of the day"
  end

  def print_hours_in_passed_seconds(hours)
    puts "#{hours} of full hours passed from the beginning of the day"
  end

  def print_seconds_passed_minute(remnat_seconds)
    puts "#{remnat_seconds} of seconds passed from the beginning of the last minute"
  end

  def print_seconds_passed_hour(remnat_seconds)
    puts "#{remnat_seconds} of seconds passed from the beginning of the last hour"
  end

  def print_minutes_passed_hour(min)
    puts "#{min} of full minutes passed from the beginning of the last hour."
  end
end

class PassedTime
  include SecondsConvert
  include OutputData

  def initialize(seconds)
    @seconds = seconds.to_i
  end

  def minutes_in_passed_seconds
    print_minutes_in_passed_seconds(get_full_minutes)
  end

  def hours_in_passed_seconds
    print_hours_in_passed_seconds(get_full_hour)
  end

  def seconds_passed_minute
    print_seconds_passed_minute(get_remainder_full_minutes)
  end

  def seconds_passed_hour
    print_seconds_passed_hour(get_remainder_full_hours)
  end

  def minutes_passed_hour
    minutes = get_remainder_full_hours / MINUTE
    print_minutes_passed_hour(minutes)
  end
end

my_time = PassedTime.new(56407)
my_time.minutes_in_passed_seconds
my_time.hours_in_passed_seconds
my_time.seconds_passed_hour
my_time.seconds_passed_minute
my_time.minutes_passed_hour