def letter_percentages(str)
  hash = { lowercase: 0.0, uppercase: 0.0, neither: 0.0 }
  length = str.size.to_f

  str.each_char do |char|
    case char
    when 'A'..'Z' then hash[:uppercase] += 1
    when 'a'..'z' then hash[:lowercase] += 1
    else               hash[:neither] += 1
    end
  end

  hash.keys.each { |k| hash[k] = (hash[k] / length) * 100 }
  hash
end


p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }