=begin

three classes
course, teacher, student

each course has one or more teachers and one or more students

Course has 1+teachers && 1+ students

in this application, the teachers and students don't interact directly, and neither needs to knw anythng
about the course to which they belong.

Course : Teacher object

Teacher and students don't interact directly.


What kind of OOP relationship should exists between objects of each pair of classes and why

Course and Teacher
Course and Student
Teacher and Student

nouns : teacher, course, student
verbs :


=end


=begin
Employee Management pplication
-info about the employees in the company: name, serial number, type of job (part-time-full time)

-all executive and managers are full-tyime.
  -exectuives are a type of manager that can hire and fire employees.

-regular employees are full-time that are neither exectuive nor a manager

Executives receive 20 days of vacation
managers receive 14 days.

Regular employee receive 10 days of vaction
Part-time receive no vacation!

Full-time employees should have a take_vacation method that can be called. (part time no)

Desk,
Executives: corner office
managers : regular private office
regular employees: desk in the cubicle farm
part-time :open workspace with no reserved desk

Managers and executives can delegate work, while other employees can not.
managers and executives should be able to call a #delegate method

if you pass an employee instance to puts, it should print info specific


NOUNS: employees, company, name, serial number, part-time or full-time, vacation, desk
VERBS: hire/ fire, take_vacation, delegate

company

employees
  take_vacation
  delegate
  hire/ fire
  serial_number


Full-time
-executive
-manager
-regular


Part-Time

name :
=end

module Manageable
  def delegate
    "Delegating work..."
  end
end

class Employee
  def initialize(name, serial)
    @name = name
    @serial = serial
    @desk = self.class::DESK
    @vacation = self.class::VACATION
    @type = self.class
  end

  private

  def to_s
    "Name : #{name} \n" +
    "Type : #{type} \n" +
    "Serial number : #{serial} \n" +
    "Vacation Days : #{vacation} \n" +
    "Desk : #{desk}"
  end

  attr_reader :name, :serial, :desk, :vacation, :type
end

class FullTime < Employee
  def take_vacation
    "#{name} has earned #{vacation} days off!"
  end
end

class Executive < FullTime
  include Manageable

  DESK = "Corner Office"
  VACATION = 20
end

class Manager < FullTime
  include Manageable

  DESK = "Private Office"
  VACATION = 14
end

class Regular < FullTime
  DESK = "Desk in cubicle farm"
  VACATION = 10
end

class PartTime < Employee
  DESK = "Open Workspace"
  VACATION = 0
end

puts "-----"
me = Regular.new("Diego", 21421422)
puts me
p me.take_vacation #10 days of vacation
#me.delegate # NoMethodError

puts "-----"
brandy = Manager.new("Brandy", 201958021)
puts brandy
p brandy.take_vacation #14 days
p brandy.delegate #can delegate

puts "-----"
mark = Executive.new("Mark", 9102412412)
puts mark
p mark.take_vacation
p mark.delegate

puts "-----"
brandon = PartTime.new("Brandon", 1250120421)
puts brandon
# brandon.take_vacation # NoMethodError

