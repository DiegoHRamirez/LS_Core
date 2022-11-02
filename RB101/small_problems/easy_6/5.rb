
def reverse!(arr)
  arr.each_with_object([]) { |element, array| array.unshift(element) }
end

list = [1,2,3,4]
p reverse!(list)
p list