
def fib(nth)
  return 1 if nth <= 2
  fib(nth - 1) + fib(nth - 2)
end


p fib(2)