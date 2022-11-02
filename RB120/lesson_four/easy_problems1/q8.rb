class Cat
  attr_accessor :type, :age

  def initialize(type)
    @type = type
    @age  = 0
  end

  def make_one_year_older
    self.age += 1
  end
end

#self inside an instance method refers to the object that called the method, the class object.
#refers to the instance that called the method.

