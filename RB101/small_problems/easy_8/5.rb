def substrings(string)
  string.chars.each_index.with_object([]) do |index, str|
    index.upto(string.size - 1) do |idx|
      str << string[index..idx]
    end
  end
end

def palindromes(string)
  substrings(string).each_with_object([]) do |substring, array|
    array << substring if substring.reverse == substring && substring.size > 1
  end
end


p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]