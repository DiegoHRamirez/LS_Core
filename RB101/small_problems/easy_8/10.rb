def center_of(string)
  center = string.size / 2
  string.size.odd? ? string[center] : string[center-1..center]
end

p center_of('I love ruby') == 'e'
p center_of('Launch School') == ' '
p center_of('Launch') == 'un'
p center_of('Launchschool') == 'hs'
p center_of('x') == 'x'