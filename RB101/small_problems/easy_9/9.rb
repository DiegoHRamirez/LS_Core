def get_grade(grade1, grade2, grade3)
  grades = []
  grades << grade1 << grade2 << grade3
  grades = grades.reduce(:+) / 3

  case grades
  when 0..60 then 'F'
  when 60..70 then 'D'
  when 70..80 then 'C'
  when 80..90 then 'B'
  when 90..100 then 'A'
  end
end

p get_grade(95, 90, 93)
p get_grade(50, 50, 95) == "D"