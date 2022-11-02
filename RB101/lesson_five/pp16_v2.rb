

def generate_uuid
  hexadecimal = ('0'..'9').to_a + ('a'..'f').to_a
  dash_position = [9, 14, 19, 24]
  uuid_string = ''

  36.times do |num|
    unless dash_position.include?(num + 1)
      uuid_string << hexadecimal.sample
    else
      uuid_string << '-'
    end
  end

  uuid_string
end


p generate_uuid
p generate_uuid
