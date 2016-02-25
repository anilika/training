#Integer24 Days of week are numbered as: 0 — Sunday, 1 — Monday, 2 — Tuesday, …, 6 — Saturday. An integer K in the range 1 to 365 is given. Find the number of day of week for K-th day of year provided that in this year January 1 was Monday.
#Integer25 Days of week are numbered as: 0 — Sunday, 1 — Monday, 2 — Tuesday, …, 6 — Saturday. An integer K in the range 1 to 365 is given. Find the number of day of week for K-th day of year provided that in this year January 1 was Thursday.
#Integer26 Days of week are numbered as: 1 — Monday, 2 — Tuesday, …, 6 — Saturday, 7 — Sunday. An integer K in the range 1 to 365 is given. Find the number of day of week for K-th day of year provided that in this year January 1 was Tuesday.
#Integer27 Days of week are numbered as: 1 — Monday, 2 — Tuesday, …, 6 — Saturday, 7 — Sunday. An integer K in the range 1 to 365 is given. Find the number of day of week for K-th day of year provided that in this year January 1 was Saturday.
#Integer28 Days of week are numbered as: 1 — Monday, 2 — Tuesday, …, 6 — Saturday, 7 — Sunday. An integer K in the range 1 to 365 and an integer N in the range 1 to 7 are given. Find the number of day of week for K-th day of year provided that in this year January 1 was N-th day of week.

class MakeCalendar
  WEEK = [ :sunday, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday]
  DAYS_YEAR = 365

  attr_reader :days_year

  def initialize(first_day_year)
    @first_day = first_day_year.downcase.to_sym
    @days_year = create_days_year
  end

  private

  def create_days_year
    i_day_week = WEEK.index(@first_day)
    days_year = {}
    (1..DAYS_YEAR).each do |day|
      i_day_week = 0 unless WEEK[i_day_week]
      days_year[day] = WEEK[i_day_week]
      i_day_week += 1
    end
    days_year
  end
end

class NumDaysYear < MakeCalendar
  attr_accessor :first_day_week

  def get_num_day_week(day_week)
    if first_day_week.downcase.to_sym == :monday && day_week == :sunday
      7
    else
      WEEK.index(day_week)
    end
  end

  def show_num_day(day)
    print "#{day} is #{@days_year[day]} with number #{get_num_day_week(@days_year[day])}"
  end
end

my_year = NumDaysYear.new("Tuesday")
my_year.first_day_week = "Sunday"
my_year.show_num_day(13)

