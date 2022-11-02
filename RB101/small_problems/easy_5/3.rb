=begin
write two methods that ake a time of day in 24 hour format and return the number of minutes before
and after midnight

=end


def time_to_minutes(time)
  hour = time.slice(0, 2).to_i
  minute  = time.slice(3, 2).to_i
  time = hour * 60 + minute

  return 0 if time == 0 || time == 1440
  time
end

def before_midnight(time)
  time = time_to_minutes(time)

  if time != 0
    time = 1440 - time
  end

  time
end

def after_midnight(time)
  time = time_to_minutes(time)
end

p after_midnight('00:00') == 0
p before_midnight('00:00') == 0
p after_midnight('12:34') == 754
p before_midnight('12:34') == 686
p after_midnight('24:00') == 0
p before_midnight('24:00') == 0