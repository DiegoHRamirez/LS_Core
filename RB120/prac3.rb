# class GoodDog
#   attr_accessor :name, :height, :weight

#   def initialize(n, h, w)
#     @name = n
#     @height = h
#     @weight = w
#   end

#   def speak
#     "#{name} says arf!"
#   end

#   def change_info(n, h, w)
#     self.name = n
#     self.height = h
#     self.weight = w
#   end

#   def info
#     "#{name} weighs #{weight} and is #{height} tall."
#   end
# end

# sparky = GoodDog.new("Sparky", '12 inches', '10 lbs')
# sparky.change_info('Spartacus', '24 inches', '45 lbs')
# puts sparky.info
# # => Sparky weighs 10 lbs and is 12 inches tall.

# module Mailable
#   def print_address
#     puts "#{name}"
#     puts "#{address}"
#     puts "#{city}, #{state} #{zipcode}"
#   end
# end

# class Customer
#   include Mailable
#   attr_reader :name, :address, :city, :state, :zipcode
# end

# class Employee
#   include Mailable
#   attr_reader :name, :address, :city, :state, :zipcode
# end

# betty = Customer.new
# bob = Employee.new
# betty.print_address
# bob.print_address



# module Drivable
#   def self.drive
#   end
# end

# class Car
#   include Drivable
# end

# bobs_car = Car.new
# bobs_car.drive


# class House
#   include Comparable

#   attr_reader :price

#   def initialize(price)
#     @price = price
#   end

#   def <=>(other_house)
#     price <=> other_house.price
#   end

# end

# home1 = House.new(100_000)
# home2 = House.new(150_000)
# puts "Home 1 is cheaper" if home1 < home2
# puts "Home 2 is more expensive" if home2 > home1

# class Transform
# 	def initialize(str)
# 		@str = str
# 	end

# 	def uppercase
# 		@str.upcase
# 	end

# 	def self.lowercase(str)
# 		str.downcase
# 	end
# end


# my_data = Transform.new('abc')
# puts my_data.uppercase
# puts Transform.lowercase('XYZ')



# class Dog

# 	def initialize(name)
# 		@name = name
# 	end

# 	def ==(other_dog)
# 		name == other_dog.name
# 	end

# 	protected

# 	attr_reader :name
# end

# sparky = Dog.new('Sparky')
# bill = Dog.new('Sparky')

# p sparky == bill

=begin
#explain what this will output and why?
-go into detail about how the #== method is implemented. It is a BasicObject#method. BasicObject checks if the
two objects are the same object. ost clases(string, arrays) overidethe basicobject inplementation to compare the values.
Here, since the #== method is not overriden, when it is called, it compares the objects, or object id.

To return true, I would have to define a #== method in the class definition to override the BasicObject implementation of the #== method.
So when the #== method is called, the method lookup path will push Ruby to look first in the Dog class.
Also, I would need to add a getter method for the instance variable `name`

Define your own #== method in the Dog class, and within the #== method definition, call the protected getter method on the objects
being compared to sompare the strings store in their instance variable `name`. The strings are compared using
the string#== method, which compares the values of the strings.

-every class in ruby inherits the built-in methods of the basicobject class.

#go into detail about the method lookup path.
-everytime you call a method, how does ruby know wheer to look?
-Ruby uses the method lookup path to search for the methods.
-

#explain how inheritance is used here, and method overriding.


=end


# class Vehicle
#   def top_speed
#     puts "100 mph"
#   end
# end

# class Car < Vehicle
# end

# class Truck < Vehicle
# end

# class SportsCar < Vehicle
#   def top_speed
#     puts '150 mph'
#   end
# end

# automobiles = [Truck.new, Car.new, SportsCar.new]

# automobiles.each(&:top_speed)




# class Jam
#   def self.play_music(transportation)
#     transportation.each(&:sound_system)
#   end
# end


# class Boat
#   def sound_system
#     puts "Playing at 150 db"
#   end
# end

# class TV
#   def sound_system
#     puts "playing at 100 db"
#   end
# end

# class Jet
#   def sound_system
#     puts "playing at 180 db"
#   end
# end

# Jam.play_music([Jet.new, TV.new, Boat.new])



# module Playable
#   def play_music
#     puts "PLAYING MUSIC!"
#   end
# end

# class Transportation
# end

# class Motorcycle < Transportation
# end

# class Car < Transportation
#   include Playable
# end

# class Laptop
#   include Playable
# end

# Car.new.play_music
# Laptop.new.play_music



# class Self
#   self #references the class itself

#   def self.display #defines class method #display
#     puts self #refernces the class `Self`, this is a class method.
#   end

#   def method
#   	puts self #refernces the calling object (instance of `Self`)
#   end
# end

# Self.display

# Self.new.method

=begin

module Greet
  def greet(message)
    puts message
  end
end

class Teacher
  include Greet
end

class Student
  include Greet
end

tom = Teacher.new
rob = Student.new

tom.greet "Bonjour!"
rob.greet "Hello!"

In this example, there are two classes defines `




=end



# class Student
#   def initialize(id, name)
#     @id = id
#     @name = name
#   end

#   def ==(other)
#     p id, other.id
#     self.id == other.id
#   end

#   def get_id
#     self.id
#   end

#   private

#   attr_reader :id, :name
# end

# rob = Student.new(123, "Rob")
# tom = Student.new(456, "Tom")

# p rob.get_id


# class Foo
#   def self.method_a
#     "Justice" + all
#   end

#   def self.method_b(other)
#     "Justice" + other.exclamate
#   end

#   private

#   def self.all
#     " for all"
#   end

#   def self.exclamate
#     all + "!!!"
#   end
# end

# foo = Foo.new
# puts Foo.method_a
# puts Foo.method_b(Foo)



# class Person
#   attr_reader :name

#   def initialize(name)
#     @name = name
#   end

#   def greet
#     "Hello! they call me #{name}"
#   end
# end

# class Puppet < Person
#   def initialize(name)
#     super
#   end

#   def greet(message)
#     puts super() + message
#   end
# end

# puppet = Puppet.new("Cookie Monster")
# puppet.greet(" and I love cookies!")


#METHOD ACCESS CONTROL

# class BankBalance
#   def initialize(account_number, balance)
#     @account_number = account_number
#     @balance = balance
#   end

#   def to_s
#     "Bank account #{account_number} has a balance of $#{balance}"
#   end

#   private

#   def account_number
#     @account_number.to_s[-4..-1]
#   end

#   protected

#   attr_reader :balance

# end

# my_bread = BankBalance.new(2142142311, 200)

# puts my_bread

class Car
  def initialize(model, year)
    @model = model
    @year = year
  end

  def drive
    puts "Driving a #{@year} #{@model}"
  end
end

class Person
  attr_accessor :name, :car
end

me = Person.new()
me.car = Car.new("Nissan Sentra", 2014)

me.car.drive
