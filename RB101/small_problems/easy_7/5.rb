def staggered_case(string)
  new_str = ''

  count = 0
  string.each_char do |char|
     count.even? ? new_str << char.upcase : new_str << char.downcase
     count += 1
  end

  new_str
end

p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'