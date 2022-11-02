array_of_strings = ["dogma", "pedantic", 'fuck it we ball']

def array_to_string(ary)
  empty_string = ""
  ary.each { |string| empty_string << string + " "}
  return empty_string
end

puts array_to_string(array_of_strings)
p array_to_string(array_of_strings)