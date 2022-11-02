=begin
input: string argument
output: string with all duplicate values removed


=end

def crunch(string)
  string.chars.each_with_object('') do |char, str|
    str << char if str[-1] != char
  end
end

p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
p crunch('4444abcabccba') == '4abcabcba'
p crunch('ggggggggggggggg') == 'g'
p crunch('a') == 'a'
p crunch('') == ''