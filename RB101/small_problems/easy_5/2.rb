=begin
write a method that takes a time using a minute based format and returns
the time of day in a 24 hou hour format (hh:mm)
any integer input valid
time is represented as $ of minutes before or after midnight

input : any integer positive or negative
output = a string displaying time in format
require 'pry'
def before_midnight(int)
  time = int % 1440
  hour, minute = time.divmod(60)
  hour = hour.to_s.prepend('0') if hour < 10
  minute = minute.to_s.prepend('0') if minute < 10
  "#{hour}:#{minute}"
end

def after_midnight(int)
  time = int % 1440
  hour, minute = time.divmod(60)
  hour = hour.to_s.prepend('0') if hour < 10
  minute = minute.to_s.prepend('0') if minute < 10

  "#{hour}:#{minute}"
end
=end
def time_of_day(int)
  time = int % 1440
  hour, minute = time.divmod(60)
  hour = hour.to_s.prepend('0') if hour < 10
  minute = minute.to_s.prepend('0') if minute < 10

  "#{hour}:#{minute}"
end

p time_of_day(0) == "00:00"
p time_of_day(-3) == "23:57"
p time_of_day(35) == "00:35"
p time_of_day(-1437) == "00:03"
p time_of_day(3000) == "02:00"
p time_of_day(800) == "13:20"
p time_of_day(-4231) == "01:29"