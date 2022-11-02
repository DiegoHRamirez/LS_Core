=begin

1. variables initialized within if blocks are initiliazed to 'nil' if the code is not executes (false condition)
if the condition is true, then the variable is just initialized to its assignment

2. informal greeting is pointed to the value of hash key a:
as a result informal_greeting uses the same object_id to access the value of a:
the << operator mutates the value

3.
a)
one is: one
two is: two
three is: three

The method creates new locally scoped objects that refernce the value of the variables passed, but it does not modify
the original variables

b)
one is: one
two is: two
three is: three

method creates new local objects and reassigns these new objects new values. The original objects are not modified.

c) the method uses the destructive operation gsub!, the local objects refernce the same value as the original objects,
so the operation changes the value of the original objects

one is : two
two is : three
three is: one
