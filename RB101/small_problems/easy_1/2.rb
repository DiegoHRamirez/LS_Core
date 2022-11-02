=begin
takes one integer argument, -,+, 0
returns true if number's abs val is odd

take integer argument
get its absolute value
determine if odd
=end

def is_odd?(integer)
  integer % 2 != 0
end
