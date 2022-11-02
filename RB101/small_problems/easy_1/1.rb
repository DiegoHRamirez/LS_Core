=begin
input : two arguments (string and positive integer)
prints the string as many times as the integer indicates

=end

def repeat(string, number)
  number.times { puts string }
end

repeat('hello', 4)
