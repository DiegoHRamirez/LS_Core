def bubble_sort!(arr)
  loop do
    swap = false
      (arr.size - 1).times do |n|
        if arr[n] > arr[n + 1]
          arr[n], arr[n + 1] = arr[n + 1], arr[n]
          swap = true
        end
      end
      break if !swap
  end
end

array = [6, 2, 7, 1, 4]

bubble_sort!(array)
p array
