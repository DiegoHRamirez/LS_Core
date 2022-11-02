
# class Student
#   attr_reader :id

#   def initialize(name)
#     @name = name
#     @id
#   end

#   def id=(value)
#     self.id = value
#   end
# end

# tom = Student.new("Tom")
# tom.id = 45

# The reason the previous code did not work was that "self.id=" is in fact a method call, which
# happened to be named exactly the same as the method from where it was being invoked.
# "self.id=(value)" is the same as "id=(value)", which causes a recursive loop and resultant SystemStackError.

class LaunchSchool
  def initialize(name, date)
    @name = name
    @date = date
  end

  private

  attr_reader :name, :date

  def to_s
    "#{name} started on #{date}"
  end
end

student = LaunchSchool.new('Diego','March 28th')

puts student

#how to intialize objects from a class
#how to encapsulate certain functionality
#overriding methods from Object class to make custom functionality