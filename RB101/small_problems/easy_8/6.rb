def fizzbuzz(num1, num2)
  num1.upto(num2) do |num|
    case num
    when num % 3 == 0 && num % 5 == 0 then print "Fizzbuzz"
    when num % 5 == 0 then print "Buzz"
    when num % 3 == 0  then print "Fizz"
    else print num
    end
    num == num2 ? print "/n" : print ", "
  end
end

fizzbuzz(1, 15)

