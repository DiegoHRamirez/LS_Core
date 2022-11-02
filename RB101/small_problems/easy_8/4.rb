def substrings(string)
  string.chars.each_index.with_object([]) do |index, str|
    index.upto(string.size - 1) do |idx|
      str << string[index..idx]
    end
  end
end


p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]