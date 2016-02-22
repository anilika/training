#Integer24 Days of week are numbered as: 0 — Sunday, 1 — Monday, 2 — Tuesday, …, 6 — Saturday. An integer K in the range 1 to 365 is given. Find the number of day of week for K-th day of year provided that in this year January 1 was Monday.
#Integer25 Days of week are numbered as: 0 — Sunday, 1 — Monday, 2 — Tuesday, …, 6 — Saturday. An integer K in the range 1 to 365 is given. Find the number of day of week for K-th day of year provided that in this year January 1 was Thursday.
#Integer26 Days of week are numbered as: 1 — Monday, 2 — Tuesday, …, 6 — Saturday, 7 — Sunday. An integer K in the range 1 to 365 is given. Find the number of day of week for K-th day of year provided that in this year January 1 was Tuesday.
#Integer27 Days of week are numbered as: 1 — Monday, 2 — Tuesday, …, 6 — Saturday, 7 — Sunday. An integer K in the range 1 to 365 is given. Find the number of day of week for K-th day of year provided that in this year January 1 was Saturday.
#Integer28 Days of week are numbered as: 1 — Monday, 2 — Tuesday, …, 6 — Saturday, 7 — Sunday. An integer K in the range 1 to 365 and an integer N in the range 1 to 7 are given. Find the number of day of week for K-th day of year provided that in this year January 1 was N-th day of week.

class DaysYear

  DAYS_YEAR = 365
  WEEK = [:monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday]

  def initialize(first_day, type_week)
    @first_day = first_day
    @type_week = type_week
    @days_year = get_days_year
  end

  def get_days_year
    i_day_week = @first_day - 1
    year = {}
    (1..DAYS_YEAR).each do |day|
      i_day_week = 0 unless WEEK[i_day_week]
      year[day] = WEEK[i_day_week]
      i_day_week += 1
    end
    year
  end

  def get_num_day_week(day_week)
    num_day_week = if @type_week == 0 && day_week == :sunday
      0
    else
      WEEK.index(day_week) + 1
    end
  end

  def show_data_day(day)
    print "#{day} is #{@days_year[day]} with number #{get_num_day_week(@days_year[day])}"
  end
end

my_year = DaysYear.new(5, 1)
my_year.show_data_day(10)