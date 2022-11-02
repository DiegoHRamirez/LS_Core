def staggered_case(string)
  new_str = ''
  letters = ('a'..'z').to_a + ('A'..'Z').to_a

  letter_count = 0
  string.each_char do |char|
    if letters.include?(char)
      char = letter_count.even? ? char.upcase : char.downcase
      letter_count += 1
    end
    new_str << char
  end

  new_str
end

p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'