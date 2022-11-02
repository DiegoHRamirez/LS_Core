def triangle(side1, side2, side3)
  sides = [side1, side2, side3].sort

  return :invalid if sides.first(2).sum < sides.last || sides.any?(0)
  return :equilateral if sides.first == sides.last
  return :isosceles if sides.any? { |s| sides.count(s) == 2 }
  :scalene
end

def triangle(side1, side2, side3)
  sides = [side1, side2, side3].sort

  return :invalid if sides.first(2) < sides.last

  case(sides.uniq.size)
  when 1 then :equilateral
  when 2 then :isosceles
  when 3 then :scalene
  end
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid
