flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]


hash = {}
flintstones.each_with_index do |element, idx|
  hash[element] = idx
end

p hash