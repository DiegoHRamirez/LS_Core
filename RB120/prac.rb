=begin
creating 2 sets of methods
-first set of methods

a(n) = # of katas done by Ann at day n
A(j) = # of katas done by john at day n

On day  n the # of katas done by Ann == n - # of katas done by john at day 't'
't' == the # of katas done herself at day 'n' - 1 (the previous day)

On day 'n' the # of katas done by John == 'n' minus the # of katas done by Ann on day t
t == # of katas done by john the previous day (n - 1)

a(0) = 1
a(0) = 0

a(1) =
function
return the list of the number of katas ann/jogn does on the first 'n' days
return an array, given an integer representing the first 'n days'
john(n)  [0, 0, 1, 2, 2, 3, 4, 4, 5, 6, 6]
day one: 0, day 2 : 0, day3: 1. day 4: 1, day 5 : 0
+0,  +0 , +1 ,+1 , +0, +1, +1, +0 +1, +1, + 0,
john does 0 on the first day,
0 on one day, 1 each day for the next 2 days, 0 on the next day, 2 the next 2 days after doing 0

ann(n) [1, 1, 2, 2, 3, 3]
ann : day1 : 1, day2: 0, day3: 0, day4:
+1, +0, +1, +0, +1, +0

1,
0

they have a pattern
1, 0, 1, 0
0, 1, 1, 0, 1, 1

create an array of the number of katas they've done to date:
data strucutre:
using an array
the elements will represent a running count of how many problems they've done up to date
return the array

intialize 'count' to an array with one element, john 0, ann 1
loop the numver of dats specified.
-add an element to the array depending on the pattern.
-john : idx is evenly divisble by 3, don't increment the count, add to the array a duplicate of the last element
-ann : increment the element that will be appended if the idx is even. odd , append the last element duplicate

return the array


0, 1, 2, 2, 3, 4, 4, 5, 6, 6]
=end




# def a(n)
#   return 1 if n == 0
#   n - j(a(n - 1))
# end

# def j(n)
#   return 0 if n == 0
#   n - a(j(n - 1))
# end

# def john(n)
#   a = []
#   n.times { |n| a << j(n) }
#   a
# end


# def katas_count_list(n)
#   ann = [1]
#   john = [0]

#   1.upto(n - 1) do |n|
#     john << (n - ann[john[n - 1]])
#     ann << (n - john[ann[n - 1]])
#   end

#   [ann, john]
# end

# def john(n)
#   katas_count_list(n).last
# end

# def ann(n)
#   katas_count_list(n).first
# end


# def ann(n)
#   ann = [1]
#   john = [0]

#   1.upto(n - 1) do |n|
#     john << (n - ann[john[n - 1]])
#     ann << (n - john[ann[n - 1]])
#   end

#   ann


# def ann(n)
#   a = []
#   n.times { |n| a << a(n) }
#   a
# end

# def sum_john(n)
#   john(n).sum
# end

# def sum_ann(n)
#   ann(n).sum
# end

# p sum_john(75)
# p sum_ann(150)

# p john(11)

# p jonn(11).sum


=begin
given 3 integers:
-first represents the gap we want to match, integer value to match
-2nd represents start of the range of numbers to look
-3rd represents the end of the range of numbers to look

-looking only for prime numbers (# only divisble by itself or 1)
-looking at the difference between primes.
-return an array containing the first pair of primes whos difference matches the 1st integer argument

implicit:
- the difference between the return value is negative,
2, 5 == 2 - 5 == -3.
- the return array is in order, least primer number first, larger prime number follows


data strucutre: array
use an array that will be mutated as necessary

algo:
iterate over the range of numbers
append to an array the primes
if the difference between the primes matches the gap, return the array

intialize an empty array called 'primes'
iterate over a range starting at the 2nd integers given, up to the 3rd integer given, passing in each integer and namign it 'idx'
  append the number to the prime arra if it is a prime?
  if the size of the array is 2,
    evaluate the difference between the 2 elements in the array
    -if the difference matches the gap, return the array
    -else delete the first element in the array

nil




is a prime?

iterate from 2 up to one less than the number, passsing in each number and assigning it to the block paramater 'num'
-return false if the number is evenly divisible by the 'num'
end
return true.
=end

# def prime?(num)
#   !!(2...num).each { |n| return false if num % n == 0}
# end

# def gap(g, m, n)
#   primes = []
#   (m..n).each do |num|
#     primes << num if prime?(num)
#     p primes
#     if primes.size > 1
#       return primes if primes.last - primes.first == g
#       primes.shift
#     end
#   end

#   nil
# end


# def gap(g, m, n)
#   primes = []
#   (m..n).each { |num| primes << num if prime?(num)}

#   p primes
#   primes.each_with_index do |prime, idx|
#     break if idx == primes.size - 1
#     pair = [prime, primes[idx + 1]]
#     return pair if pair[-1] - pair[-2] == g
#   end

#   nil
# end


# def gap(g, m, n)
#   primes = []
#   (m..n).each do |num|
#     if prime?(num)
#       primes << num
#       break
#     end
#   end

#   loop do
#     prime = primes.last
#     p primes
#     break if prime > n

#     p prime
#     p prime + g
#     if prime?(prime + g)
#       return [prime] << prime + g
#     else
#       (prime + 1..n).each do |num|
#         if prime?(num)
#           primes << num
#           break
#         end
#       end
#     end
#   end

#   nil
# end

# require 'prime'

# def gap(g, m, n)
#   primes = []

#   # Prime.each do |prime|
#   #   break if prime > n
#   #   primes << prime
#   #   if primes.size > 1
#   #     pair = [primes[-2], primes[-1]]
#   #     return pair if pair.last - pair.first == g
#   #   end
#   # end

#   (m..n).each do |num|
#       primes << num if num.prime?
#       if primes.size > 1
#         pair = [primes[-2], primes[-1]]
#         return pair if pair.last - pair.first == g
#       end
#     end

#   nil
# end



# p gap(2,3,50)
# p gap(10, 300, 400)


# def next_smaller n
#   digits = n.digits.sort
#   return -1 if n.to_s.chars.map(&:to_i) == digits

#   loop do
#     n-= 1
#     n_digits = n.digits
#     break if n_digits.size < digits.size
#     return n if n_digits.sort == digits
#   end

#   -1
# end


# def substrings(str)
#   (0...str.size).each.with_object([]) do |idx, substring|
#     (idx...str.size).each do |idx2|
#       current_substring = str[idx..idx2]
#       substring << current_substring if current_substring.size == str.size
#       end
#     end
# end

# p substrings('string')

# def next_smaller(n)
#   digits = n.to_s.chars
#   return -1 if digits == digits.sort

#   1.upto(n.size - 1) do |n|
#     cdigits = digits.last(n + 1)

#     next if cdigits.sort == cdigits
#     num_strings = substrings(cdigits).sort.reverse
#     num_strings.each do |num_str|
#       if num_str.to_i < cdigits.join.to_i
#         digits.pop(n + 1)
#         digits = digits << num_str
#       end
#     end
#     break
#   end
#   digits.join.to_i
# end

# p next_smaller(1234567908)
# # p next_smaller(907)
# p next_smaller(531)
# p next_smaller(2071)
# p next_smaller(123456789)



=begin
on line 14, a new Student object is instantiated and passed the string object 'Tom' as an argument.
The new instance of the Student class is assigned tot he variable 'tom'

on line 15, the Student#id instance setter method is called on the Tom object, and the integer
`45` is passed as an argument. This invokes the instance setter method on line 9.
Within the method definition, the 'self' keyword refers to the calling object. This is put here
to disambiguate between initializing a local variable and calling the setter method.
However, `attr_reader` only creates a getter method for the instance variable, so the code on line 14
will recursively call itself, until a SystemStackError occurs.

The code itself will not output anything, but the return value of the setter method will be the argument
passed into it, the integer '45'

=end

# class Circle
#   def initialize(radius)
#     @radius = radius
#   end

#   # def >(other)
#   #   area > other.area
#   # end

#   def area
#     Math::PI * (radius * radius)
#   end

#   attr_reader :radius
# end

# circle_a = Circle.new(5)
# circle_b = Circle.new(4)

# p circle_a > circle_b # true

# class Circle
#   include Comparable

#   def initialize(radius)
#     @radius = radius
#   end

#   def <=>(other_circle)
#     area <=> other_circle.area
#   end
#   # def >(other)
#   #   area > other.area
#   # end

#   def area
#     Math::PI * (radius * radius)
#   end

#   attr_reader :radius
# end

# circle_a = Circle.new(5)
# circle_b = Circle.new(4)

# p circle_a > circle_b == circle_b < circle_a
# p circle_a >= circle_b == circle_b <= circle_a
# module Manageable
#   def delegate
#     "Delegating work..."
#   end
# end

# class Employee
#   def initialize(name, serial)
#     @name = name
#     @serial = serial
#     @desk = self.class::DESK
#     @vacation = self.class::VACATION
#     @type = self.class
#   end

#   private

#   def to_s
#     "Name : #{name} \n" +
#     "Type : #{type} \n" +
#     "Serial number : #{serial} \n" +
#     "Vacation Days : #{vacation} \n" +
#     "Desk : #{desk}"
#   end

#   attr_reader :name, :serial, :desk, :vacation, :type
# end

# class FullTime < Employee
#   def take_vacation
#     "#{name} has earned #{vacation} days off!"
#   end
# end

# class Executive < FullTime
#   include Manageable

#   DESK = "Corner Office"
#   VACATION = 20
# end

# class Manager < FullTime
#   include Manageable

#   DESK = "Private Office"
#   VACATION = 14
# end

# class Regular < FullTime
#   DESK = "Desk in cubicle farm"
#   VACATION = 10
# end

# class PartTime < Employee
#   DESK = "Open Workspace"
#   VACATION = 0
# end

# puts "-----"
# me = Regular.new("Diego", 21421422)
# puts me
# p me.take_vacation #10 days of vacation
# #me.delegate # NoMethodError

# puts "-----"
# brandy = Manager.new("Brandy", 201958021)
# puts brandy
# p brandy.take_vacation # 14 days
# p brandy.delegate # can delegate

# puts "-----"
# mark = Executive.new("Mark", 9102412412)
# puts mark
# p mark.take_vacation
# p mark.delegate

# puts "-----"
# brandon = PartTime.new("Brandon", 1250120421)
# puts brandon
#brandon.take_vacation # NoMethodError
# puts "-----"
# brandy = Manager.new("Brandy", 201958021, 'full')
# puts brandy
# p brandy.take_vacation #14 days
# p brandy.delegate #can delegate

# puts "-----"
# mark = Executive.new("Mark", 9102412412, 'full')
# puts mark
# p mark.take_vacation
# p mark.delegate

# puts "-----"
# brandon = PartTime.new("Brandon", 1250120421, 'part-time')
# puts brandon
# brandon.take_vacation # NoMethodError


# class Student
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end
# end

# name = "Megan"
# student = Student.new(name)
# p student.name
# name.upcase!
# p student.name

=begin
The value referenced by an instance variable is encapsulated as part of the state of the object
and not available to the public interface because of its scope

Don't have access to this value from the public interface because this value
is referenced by an instance variable, which is encapsulate
=end

# class Person                # 1
#   attr_accessor :name       # 2
#                             # 3
#   def initialize(name)      # 4
#     @name = name            # 5
#   end                       # 6
#                             # 7
#   def change_name           # 8
#     name.upcase!     # 9
#   end                       # 10
# end                         # 11
#                             # 12
# bob = Person.new('Bob')     # 13
# p bob.name # => 'Bob'       # 14
# bob.change_name
# p bob.name

# What is method access control?


# what is attr_accessor?
# a method in Ruby that facilitates creating getter and setter methods.
# setter methods
# getter methods
# strucutre of attr_accessor
# example

# class Dog
#   attr_accessor :name, :age

#   def initialize(name, age)
#     @name = name
#     @age = age
#   end
# end

# pup = Dog.new("Lucky", 5)
# p pup.name
# pup.name = "Luck"
# p pup.name
# p pup.age

#what is method access control???
# access modifiers : private, public, and protected
# involves controlling the access of methods
# a method to encapsulate specific behavior

# class AirlinePoints
#   def initialize(acc_number)
#     @points = 0
#     @account = acc_number
#   end

#   def add(points)
#     @points += points
#   end

#   private

#   def to_s
#     "#{account} has #{points} points"
#   end

#   attr_reader :account, :points
# end

# my_points = AirlinePoints.new(21421421)
# #my_points.to_s
# puts my_points

# my_points.add(50)
# puts my_points

=begin
-classes
-objects
=end

# class Animal
#   def initialize(name)
#     @name = name # contains attributes about an object
#   end

#   attr_reader :name
# end

# dog = Animal.new("Dog") #instantiating a new object
# dog2 = Animal.new("Dog")

# p dog.name
# p dog2.name
# p dog == dog2


# DEFINE ENCAPSULATION
=begin

=end
# class BankAccount
#   def initialize(account_number)
#     @account = account_number
#     @balance = 200
#   end

#   def to_s
#     "#{account} has a balance of: $#{balance}"
#   end

#   protected

#   private

#   attr_reader :balance, :account
# end

# my_account = BankAccount.new(21412421)
# puts my_account

# my_account.balance

# DEFINE ENCAPSULATION
#objets are bundles of states/ information
#instance methods (behaviors an object perform) can expose information about those states
# method access control
=begin

access modifiers : public, private, protected
-public comprise, the class pubilc interface :
-private methods : methods unavailable outside of the class.
-protected methods : cannot be called from outside the class, allow access between instances of the class


=end


# class BankAccount
#   def initialize(name, account, balance = 200)
#     @name = name
#     @account = account
#     @balance = balance
#   end

#   def to_s
#     "#{account} has a balance of #{balance}"
#   end

#   def compare_balances(other_account)
#     bigger_balance = balance > other_account.balance ? self :  other_account

#     "#{bigger_balance.name} has a greater balance than #{other_account.name}"
#   end

#   protected

#   attr_reader :balance, :name

#   private

#   attr_reader :account
# end

# my_checking = BankAccount.new("checking", 201421412)

# my_savings = BankAccount.new("savings", 28213912312, 500)

# p my_savings.compare_balances(my_checking)




=begin

Encapsulation
# method access control,
#

=end

# class BankAccount
#   def initialize(name, account_number, balance = 200)
#     @name = name
#     @account = account_number
#     @balance = balance
#   end

#   def to_s
#     "#{name} has a balance of $#{balance}"
#   end

#   def compare_balance(other_account)
#     bigger_balance = balance > other_account.balance ? self : other_account

#     "#{bigger_balance.name} has a bigger balance"
#   end

#   def show_encapsulation
#     p self
#   end

#   protected

#   attr_reader :name, :balance

#   private

#   attr_reader :account
# end

# my_account = BankAccount.new("checking", 214214152)
# my_savings = BankAccount.new("savings", 5311512412, 250)


# puts my_account
# p my_account.compare_balance(my_savings)

# my_account.show_encapsulation



# CLASS VS ISNTANCE METHODS

# class Animal
#   def initialize
#   end

#   def instance_method
#   end

#   def self.class_method
#   end
# end

# Animal.class_method

# Animal.new.instance_method

# class Cat
#   def initialize(name)
#     @name = name
#   end

#   def to_s
#     "My name is #{name}"
#   end

#   def name
#     @name.capitalize
#   end
# end

# garfield = Cat.new("gar")

# puts garfield


# class EmployeeManagementSystem
#   attr_reader :employer

#   def initialize(employer)
#     @employer = employer
#     @employees = []
#   end

#   def add(employee)
#     if exists?(employee)
#       puts "Employee serial number is already in the system."
#     else
#       employees.push(employee)
#       puts "Employee added."
#     end
#   end

#   alias_method :<<, :add

#   def remove(employee)
#     if !exists?(employee)
#       puts "Employee serial number is not in the system."
#     else
#       employees.delete(employee)
#       puts "Employee deleted."
#     end
#   end

#   def exists?(employee)
#     employees.any? { |e| e == employee }
#   end

#   def display_all_employees
#     puts "#{employer} Employees: "

#     employees.each do |employee|
#       puts ""
#       puts employee.to_s
#     end
#   end

#   private

#   attr_accessor :employees
# end

# class Employee
#   attr_reader :name

#   def initialize(name, serial_number)
#     @name = name
#     @serial_number = serial_number
#   end

#   def ==(other)
#     serial_number == other.serial_number
#   end

#   def to_s
#     "Name: #{name}\n" +
#     "Serial No: #{abbreviated_serial_number}"
#   end

#   protected

#   attr_reader :serial_number

#   private

#   def abbreviated_serial_number
#     serial_number[-4..-1]
#   end
# end

# # Example

# miller_contracting = EmployeeManagementSystem.new('Miller Contracting')

# becca = Employee.new('Becca', '232-4437-1932')
# raul = Employee.new('Raul', '399-1007-4242')
# natasha = Employee.new('Natasha', '399-1007-4242')

# miller_contracting << becca     # => Employee added.
# miller_contracting << raul      # => Employee added.
# miller_contracting << raul      # => Employee serial number is already in the system.
# miller_contracting << natasha   # => Employee serial number is already in the system.
# miller_contracting.remove(raul) # => Employee deleted.
# miller_contracting.add(natasha) # => Employee added.

# miller_contracting.display_all_employees



# Problem by Natalie Thompson
# class Person
#   def initialize(name, job)
#     @name = name
#     @job = job
#   end

#   def to_s; "My name is #{@name} and I am a #{@job}" end
# end

# roger = Person.new("Roger", "Carpenter")
# puts roger

# Add 1 line of code for the person class
# and 1 line of code in the initalize method.


#Other than that don't change Person.

# Output:
# "My name is Roger and I am a Carpenter"


# ================================================================


# Problem received from Raul Romero
# class Human
#   attr_reader :name, :hair

#   def initialize(name="Dylan")
#     @name = name
#   end

#   def hair_colour(color)
#     @hair = color
#     self
#   end

#   def to_s
#     "Hi, my name is #{name} and I have #{hair} color"
#   end

#   def self.hair_colour(color)
#   Human.new.hair_colour("blonde")
#   end
# end

# puts Human.new("Jo").hair_colour("blonde")
# # Should output "Hi, my name is Jo and I have blonde hair."

# puts Human.hair_colour("")
# Should "Hi, my name is Dylan and I have blonde hair."

# # ================================================================








# class Human  # Problem received from Raul Romero
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   def equal?(other_human)
#     name == other_human.name
#   end

#   def +(other_human)
#     "annagilles"
#   end

# end

# gilles = Human.new("gilles")
# anna = Human.new("gilles")

# puts anna.equal?(gilles)#should output true #
# puts anna + gilles # should output annagilles


# # ================================================================











# #describe what the code below outputs and why from Joseph Ochoa

# module Attackable
#   def attack
#     "attacks!"
#   end
# end

# class Characters
#   attr_accessor :name, :characters

#   def initialize(name)
#     #
#     self.name = name
#     @characters = []
#   end

#   def display
#     name
#   end

#   protected
#   attr_reader :name
#   attr_writer :name
# end

# class Monster < Characters
#   include Attackable

#   def initialize(name)
#     super
#   end
# end

# class Barbarian < Characters
#   def ==(other)
#     if(super.self == super.self) #
#       super.self == super.self
#     end
#   end
# end

# conan = Barbarian.new('barb')
# rob = Monster.new('monst')
# conan.characters << rob
# p conan.display

# # ================================================================









# From Joseph Ochoa
# give class Barbarian the functionality of the Monster instance attack method:
  # If you used class inheritance, now try doing it without class inheritance directly.
  # If you used modules, now try not using modules
  # If you used duck typing, now don't use duck typing

# class Monster
#   def attack
#     "attacks!"
#   end
# end

# class Barbarian
#   attr_reader :enemy
#   def initialize
#     @enemy = Monster.new
#   end
# end

# p Barbarian.new.enemy.attack
# # # ================================================================










# Without adding any methods below, implement a solution; originally by Natalie Thompson,
# this version by Oscar Cortes
# class ClassA
#   attr_reader :field1, :field2

#   def initialize(num)
#     @field1 = "xyz"
#     @field2 = num
#   end
# end

# class ClassB
#   attr_reader :field1

#   def initialize
#     @field1 = "abc"
#   end
# end


# obj1 = ClassA.new(50)
# obj2 = ClassA.new(25)
# obj3 = ClassB.new


# p obj1.field2 > obj2.field2
# p obj2.field1 > obj3.field1

# # ========================================================================









# Unknown
# class BenjaminButton
#   attr_accessor :actual_age
#   attr_reader :appearance_age

#   def initialize
#     self.actual_age = 0
#     @appearance_age = 100
#   end

#   def get_older
#     @actual_age += 1
#     @appearance_age -= 1
#   end

#   def look_younger
#   end

#   def die
#     self.actual_age = 100
#     @appearance_age = 0
#   end
# end

# # class BenjaminButton
# # end


# benjamin = BenjaminButton.new
# p benjamin.actual_age # => 0
# p benjamin.appearance_age # => 100

# benjamin.actual_age = 1
# p benjamin.actual_age # 1

# benjamin.get_older
# p benjamin.actual_age # => 2
# p benjamin.appearance_age # => 99

# benjamin.die
# p benjamin.actual_age # => 100
# p benjamin.appearance_age # => 0

# # ========================================================================









# Originally by Natalie Thompson, this version by James Wilson
# class Wizard
#   attr_reader :name, :hitpoints

#   def initialize(name, hitpoints)
#     @name = name
#     @hitpoints = hitpoints
#   end

#   def fireball
#     "casts Fireball for 500 damage!"
#   end

# end

# class Summoner < Wizard
#   attr_reader :souls

#   def initialize(name, hitpoints)
#     super
#     @souls = []
#   end

#   def soul_steal(character)
#     @souls << character
#   end
# end

# gandolf = Summoner.new("Gandolf", 100)
# p gandolf.name # => "Gandolf"

# valdimar = Wizard.new("Valdimar", 200)
# p valdimar.fireball #=> "casts fireball for 500 damage!"

# p gandolf.hitpoints #=> 100

# p gandolf.soul_steal(valdimar) #=> [#<Wizard:0x000055d782470810 @name="Valdimar", @hitpoints=200>]

# p gandolf.souls[0].fireball #=> "casts fireball for 500 damage!"


# # ========================================================================









# # LS Man...legend says LS Man first appeared in SPOT.
module Flightable
  def fly
    'fly'
    self
  end
end

class Superhero
  include Flightable

  attr_accessor :ability
  attr_reader :name
  def self.fight_crime
  end

  def initialize(name, ability = fly)
    @name = name
    @ability = Ability.new(ability)
  end

  def announce_ability
    puts "I fight crime with my #{ability.description} ability!"
  end

  def to_s
    "I am #{name}, I am a superhero, and I can #{ability.description}"
  end
end

class LSMan < Superhero
  ABILITY = "coding skills"
  def self.fight_crime
    puts "I am LSMan!"
    Superhero.new(self, ABILITY).announce_ability
  end
end

class Ability
  attr_reader :description

  def initialize(description)
    @description = description
  end
end

superman = Superhero.new('Superman')

puts superman.fly # => I am Superman, I am a superhero, and I can fly!

LSMan.fight_crime
# => I am LSMan!
# => I fight crime with my coding skills ability!
# # ========================================================================
