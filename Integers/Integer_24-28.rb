def get_week(first_day_week)
  week = []
  7.times do |day|
    week.push(first_day_week)
    first_day_week += 1
  end
  week
end

#print get_week(0)

def get_position_week(week, days, day_w)
  days_years = {}
  (1..days).each do |day|
    puts day
    day_w = 0 unless week[day_w]
    days_years[day] = week[day_w]
    day_w += 1
  end
  days_years
end

print get_position_week(get_week(1), 34, 5)
