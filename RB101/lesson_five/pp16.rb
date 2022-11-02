

def generate_uuid
  hexadecimal = (0..9).to_a + ('a'..'f').to_a
  dash_position = [9, 14, 19, 24]
  uuid_string = []

  counter = 1
  loop do
    if !(dash_position.include?(counter))
      uuid_string << hexadecimal.sample
    else
      uuid_string << '-'
    end
    break if counter == 36
    counter += 1
  end

  uuid_string.join
end


p generate_uuid
p generate_uuid
