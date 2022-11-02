def print_row(initial_space, spaces)
  print "#{" " * initial_space}*#{ " " * spaces }*#{ " " * spaces }*\n"
end

def star(n)
  mid = n / 2 - 1
  first_space = 0

  mid.downto(0) do |n|
    print_row(first_space, n)
    first_space += 1
  end

  print "#{"*" * n}\n"

  0.upto(mid) do |n|
    first_space -= 1
    print_row(first_space, n)
  end
end

star(9)
=begin
  mid.times do |n|


  1.upto(n) do |num|
    case num
    print "*" when num ==
=end
