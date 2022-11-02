
def fibonacci(nth)
  fib = [1, 1]
  return 1 if nth <= 2
  (nth - 2).times do
    fib << fib.shift + fib.last
  end

  fib.last
end

p fibonacci(100_001)