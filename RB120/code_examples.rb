CLASS
class CamelCase #defined with 'class', name in CamelCase
  def initialize #gets called at instantiateion. Referred to as a constructor ( builds the object when a new object is instantiated)
    @instance_variable = 'instance var'
  end
end

camel = CamelCase.new # class method that instantiates a new object

OBJECT

class Animal
  def initialize(name, animal)
    @name = name # instance variable to keep track of state
    @animal = animal
  end

  def move #instance methods keep track of behaviors
    puts "MOVING!"
  end
end

dog = Animal.new('rotty', 'Dog') #instantiating a new object with the #new class method.
dog.move #invoking an instance method on the Animal object


METHOD ACCESS CONTROL

class BankBalance
  def initialize(account_number, balance)
    @account_number = account_number
    @balance = balance
  end

  def to_s
    "Bank account #{account_number} has a balance of $#{balance}"
  end

  private

  def account_number
    @account_number.to_s[-4..-1]
  end

  protected

  attr_reader :balance

end

my_bread = BankBalance.new(2142142311, 200)

puts my_bread


CLASS_METHOD EXAMPLE
class Move
  def self.run #class method prepended with self
    puts "running"
  end
end

Move.run #called by appending the method name to the class name.
#can be called without instantiating a new object.

REFERNCING_AND_SETTING_VS_GETTERS_AND SETTERS

class BankBalance
  attr_reader :balance

  def initialize(balance, acc_number)
    @balance = balance
    @account_number = acc_number
  end

  def account_number #custom behavior for the getter method that doesn't show the whole acc number
    @account_number.to_s[-4..-1]
  end

  def to_s
    "Account xxxx#{account_number} has a balance of #{balance}" #using the getter to only show half of the acc number
  end
end

my_bread = BankBalance.new(100, 12412112)
puts my_bread

CLASS_INHERITANCE

class Music
  attr_reader :song

  def initialize(song)
    @song = song
  end

  def play
    puts "#{song} is music to my ears"
  end
end

class Rap < Music # the `<` indicates that class Rap is a subclass of the superclass `Music`
end

fav_song = Rap.new('up') #objects instantiated from the `Rap` class have the constructor method from `Rap` invoked
fav_song.play #it inherits its the behaviors of the superclass

ENCAPSULATION

class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def change_legal_name=(new_name)
    self.name = new_name
  end

  def greet
    "Hi, my name is #{name}"
  end

  private #use of access modifier to make the writer a private method

  attr_writer :name
end

me = Person.new("Diego")
me.change_legal_name = "Santiago" #changed name, without accessing the private behavior

puts me.greet #accessed the name without using the private getter method.

POLYMORPHISM_THROUGH_INHERITANCE


class Vehicle
  def top_speed
    puts "100 mph"
  end
end

class Car < Vehicle
end

class Truck < Vehicle
end

class SportsCar < Vehicle
  def top_speed  #use method overriding to allow this class to respond differently to the same method invocation.
    puts '150 mph'
  end
end

automobiles = [Truck.new, Car.new, SportsCar.new]

automobiles.each(&:top_speed)
# relies on method overriding and method lookup path.
#lets you work with each object the same way even with different implementations.


DUCKTYPING_POLYMORPHISM


class Jam
  def self.play_music(transportation)
    transportation.each(&:sound_system)
  end
end


class Boat
  def sound_system
    puts "Playing at 150 db"
  end
end

class TV
  def sound_system
    puts "playing at 100 db"
  end
end

class Jet
  def sound_system
    puts "playing at 180 db"
  end
end

#the Jam class can depend on all the objects in the collection having a `sound_system` method.
# they each have unique implementation
Jam.play_music([Jet.new, TV.new, Boat.new])


MODULES

module Playable
  def play_music # play_music method that was not applicable to the `Motorcycle` class extracted to module `Playable`
    puts "PLAYING MUSIC!"
  end
end

class Transportation
end

class Motorcycle < Transportation
end

class Car < Transportation
  include Playable
end

class Laptop
  include Playable
end

Car.new.play_music
Laptop.new.play_music

SELF

class Self
  self #references the class itself

  def self.display #defines class method #display
    puts self #refernces the class `Self`, this is a class method.
  end

  def method
  	puts self #refernces the calling object (instance of `Self`)
  end
end

Self.display

Self.new.method


COLLABORATOR OBJECTS

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
me.car = Car.new("Nissan Sentra", 2014) #custom car object assigned to the instance variable in Person object

me.car.drive
