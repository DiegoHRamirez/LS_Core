
def leading_substrings(string)
  string.chars.each_index.with_object([]) {|index, array| array << string[0, index + 1] }
end

p leading_substrings('abc') #== ['a', 'ab', 'abc']
