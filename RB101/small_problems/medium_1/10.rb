def fibonacci_last(nth)
  fib = [1, 1]
  return 1 if nth <= 2
  (nth - 2).times do
    fib << fib.shift + fib.last % 10
  end

  last_digit = fib.pop
end

p fibonacci_last(123456789)