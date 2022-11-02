=begin
counts the number of occurrences of each element in an array
input: arary
output: number of occurences of each element
=end

def count_occurrences(array)
  array.uniq.each do
    |type| puts "#{type} => #{array.count(type)}"
  end
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)
