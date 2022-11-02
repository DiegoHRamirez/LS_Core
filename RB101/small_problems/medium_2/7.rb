require 'date'

def friday_13th(year)
  num_of_days = Date.gregorian_leap?(year) ? 366 : 365
  first_day = Date.new(year)
  friday_13ths = 0

  num_of_days.times do
    friday_13ths += 1 if first_day.friday? && first_day.day == 13
    first_day += 1
  end

  friday_13ths
end


p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2