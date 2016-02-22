#Integer24 Days of week are numbered as: 0 — Sunday, 1 — Monday, 2 — Tuesday, …, 6 — Saturday. An integer K in the range 1 to 365 is given. Find the number of day of week for K-th day of year provided that in this year January 1 was Monday.
#Integer25 Days of week are numbered as: 0 — Sunday, 1 — Monday, 2 — Tuesday, …, 6 — Saturday. An integer K in the range 1 to 365 is given. Find the number of day of week for K-th day of year provided that in this year January 1 was Thursday.
#Integer26 Days of week are numbered as: 1 — Monday, 2 — Tuesday, …, 6 — Saturday, 7 — Sunday. An integer K in the range 1 to 365 is given. Find the number of day of week for K-th day of year provided that in this year January 1 was Tuesday.
#Integer27 Days of week are numbered as: 1 — Monday, 2 — Tuesday, …, 6 — Saturday, 7 — Sunday. An integer K in the range 1 to 365 is given. Find the number of day of week for K-th day of year provided that in this year January 1 was Saturday.
#Integer28 Days of week are numbered as: 1 — Monday, 2 — Tuesday, …, 6 — Saturday, 7 — Sunday. An integer K in the range 1 to 365 and an integer N in the range 1 to 7 are given. Find the number of day of week for K-th day of year provided that in this year January 1 was N-th day of week.

module MakeWeek
  def get_week(first_day_week)
  week = []
   7.times do |day|
      week.push(first_day_week)
      first_day_week += 1
    end
    week
  end
end

class DaysYear
  include MakeWeek

  DAYS_YEAR = 365
  SUNDAY_WEEK = {
    0 => :sunday, 1 => :monday, 2 => :tuesday, 3 => :wednesday,
    4 => :thursday, 5 => :friday, 6 => :saturday
  }
  MONDAY_WEEK = {
    1 => :monday, 2 => :tuesday, 3 => :wednesday, 4 => :thursday,
    5 => :friday, 6 => :saturday, 7 => :sunday
  }

  def initialize(first_day, type_week)
    @first_day = first_day
    @type_week = type_week
    @week = get_week(@type_week)
    @year = {}
  end

  def get_year
    @type_week == 1 ? i_day = @first_day - 1 : i_day = @first_day
    year = {}
    (1..DAYS_YEAR).each do |day|
      i_day = 0 unless @week[i_day]
      year[day] = @week[i_day]
      i_day += 1
    end
    @year = year
  end

  def show_data_day(day)
    num_day_week = @year[day]
    day_week = if @type_week == 1 then
      MONDAY_WEEK[num_day_week]
    else
      SUNDAY_WEEK[num_day_week]
    end
    print "#{day} is #{day_week} with number #{num_day_week}"
  end
end

my_year = DaysYear.new(5, 1)
my_year.get_year
my_year.show_data_day(10)