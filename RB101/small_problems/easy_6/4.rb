=begin
def reverse!(arr)
  reversed_arr = []

  counter = -1
  loop do
    reversed_arr << arr[counter]
    counter -= 1
    break if reversed_arr.size == arr.size
  end

  counter = 0
  loop do
    arr[counter] = reversed_arr[counter]
    counter += 1
    break if counter == 4
  end
end
=end

def reverse!(arr)
  reversed_arr = []
  counter = -1

  loop do
    reversed_arr << arr[counter]
    counter -= 1
    break if reversed_arr.size == arr.size
  end

  arr.size.times {|n| arr[n] = reversed_arr[n]}
end

list = [1,2,3,4]
p reverse!(list)
p list