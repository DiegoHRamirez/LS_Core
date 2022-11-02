array = [1, 3, 5, 64, 7, 2]



def every_other_element(ary)
  new_array = []
  ary.each_with_index do |element, idx|
    new_array << element if idx.even?
  end
  return new_array
end

p every_other_element(array)