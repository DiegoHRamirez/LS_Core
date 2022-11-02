=begin
leap years occur every year that is evenly divisible by 4, unless the year is also divisible by 100
if the year is evenly divisible by 100, then it is not a leap year unless the year is evenly divisible by 400
input: year greater than 0
output: determines whether the yer is a leap year or not (boolean)
=end

def leap_year?(year)
  if year % 4 == 0
    if year % 100 == 0
      return year % 400 == 0
    end
    true
  else
   false
  end
end

=begin
  (year % 400 == 0) || (year % 4 == 0 && year % 100 != 0)
=end


p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true