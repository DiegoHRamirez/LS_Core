def featured(num)
  feat = 0

  loop do
   feat += 7
   if feat >= 9_876_543_210
    return "There is no possible number that fulfills those requirements."
   end

   if feat > num
    feat.digits.uniq.size == feat.digits.size && feat.odd? ? break : next
   end
  end

  feat
end

p featured(9_999_999_999)