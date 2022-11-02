=begin
the method 'repeated' is defined with a paramater string on lines 1 - 9.
The 'repeater' method is invoked with the string object 'hello' passed as an argument.
The string 'hello' is assigned to the local variable stirng.
Within the method, the local variable 'result' is set to an empty stirng object.
The each_char method is invoked on the local variable string. Each one letter string object in
the string is passed into the block and assigned to the local variable char.
The '<<' method is called on the empty string 'result' with 'char' as an argument.
Another '<<' method is chained onto the return value of the of the 'result << char' method,
appending the current element twice at the end of the empty string.
The block returns the appended array to the each method, being the last line executed, but 'each_char'
ignores it.
The last line within the repeater method is the new string object initiaized on line 2, and the one that
was mutated during every iteration. Since it is the last line, it is return value of the method. The method repeater
returns a new string with each character repeating twice, 'HHeelllloo'
=end

#ex 8
=begin
variable x is initialized and assigned to string object 'hi there' on line 1.
variable my_hash is initialized and assigned to a hash object with a one key value pair on line 2.
THe key-value pair consists of the string object 'x' implicitly converted to a symbol object with
the shorthand syntax {key: pair}. It's value is the string object 'some value'.
On ilne 3, variable my_hash2 is assigned to a new hash object with one key-value pair.
It's key is a reference to the variable 'x', with the string object 'some value' as its value.
THis demonstrates variables as pointers and the difference between symbols and variables.
=end

#ex 7

=begin
the variable 'total' is initialized and assigned to the integer object 0 on line 1.
On line 2, the 'each' method is called on array object '[1, 2, 3]'. Each integer object is passed
into the block defined by the 'do..end' keywords on lines 2-4. Once each integer object is passed
into the block, it is assigned to local variable number.
On line 3, the variable in the outer scope 'total' that is accessible by the block, is reassigned
to the return value of the '+' operation with operands 'total' and 'number' using the shorthand syntax
'+=', this changes the value of the 'total' variable in the outer scope. Being the last line executed, it
is also the return value of the block. The block returns the reassigned total variable to the each
method, but each ignores it.
One lin 5, the puts method is invoked with local variable 'total' passed as an argument, outputting
the sum of the array. Puts will return nil.
=end

#ex 6
=begin
method 'test' is defined on lines 1-3 with one parameter 'b'.

on line 5, variable 'a' is assigned to an array object with three string objects as elements. ['a', 'b', 'c']
On line 6, the test method is invoked with variable a passed as an argument.

Within the metohd, variabel a gets assigned to local variable b, referencing the same object, but as different variables.
The map method is called on the array object 'b'. Each string object is passed into the method and reassigned to
local variable 'b' at each iteration. There is only one line in the block, a string that used interpolation to
contain the value of local variable 'letter'. Being the only line, it is also the return value of the block.
The block returns this value to the map method, and map takes the new string and puts it in a new array.
Map returns a new array with ["I like the letter: a", "I like the letter: 'b', I like the leter: 'c'"], which is also the
return value of the test method.
=end

#ex 5
=begin
on line 5, the method include? is invoked with an array passed as the first argument '[1, 2, 3, 4, 5], and an integer object '6' passed as the
second argument.
The method is defined on lines 1-3, and within the method the array object and the integer object passed as arguments
are assigned to the local variables 'arr' and 'search_item' respectively. They still point to the same object, just as
different variables.
On line 2, the each method is called on the local array object 'arr'. Each integer element within the array
is passed to the one-line block denoted by the '{}' curly braces. Each integer element is assigned
to the local variable 'item' when it is passed in. Within the block, the comparison '==' operator is perforemd on
the two operands, the 'item' variable and the 'search_item' variable. The comparison returns a boolean that is
used by the shorthand 'if' conditional to determine the execution flow. When the expression evaluates to true,
the 'return' statement breaks out of the method and the method returns the boolean value 'true'. If the expression
does not evaluate to true, the if conditional returns 'nil', which will also be the return value of the block.
Block returns nil to the each method, which each ignores. Each returns the original array object it was called on, 'arr'.
The return value of each is used by the '!' operator. And since everything in ruby is truthy, the bang operator
takes takes the truthiness of the object and returns the opposite, returning false. The method then returns false.

=end

#ex 6
=begin

on line 4, variables 'arr1' and 'arr2' are parallel assigned to the array objects '["hello'] and '['hello', 'world'], respectively.
On line 6, variable 'merged' is assigned to the return value of calling the merge method with arguments 'arr1' and 'arr2'.
The method is defined on lines 1-3.
Within the method, 'arr1' and 'arr2' are assigned to local variables 'array_1' and 'array_2', they stil point to
the same array object, but with different variable names. On line 2, the '|' method is called with arguments
'array_1' and 'array_2', and it returns a new array
removing the duplicate elements, while preserving order. Being the only statement evaluated, the method
returns the new array.
The return value of the method is assigned to the 'merged' variable.
On line 7, the mutative setter method []= is invoked on the zero-indexed character of the string 'hello' within the
merged array object 'merged'.
Bracket notation merged[0] accesses the first element of the array, returning the first string object. The destructive
setter method uses the return value accessing the zero-indexed character of the string and changing the value of the
first string character to 'J'
on like 8, the p method is invoked with array 'merged' as an argument. It prints the array ['Jello', 'world']
On line 9, the p method is invoked with array 'arr1' as an argument. It is importnat to note here that
the mutative setter method on line 7 changed the merged object, but the elements within merge were objects 
from arr1. In short, the objects in the 'merged' contain the same variable pointers as the two arrays it was created from
in the 'merge' method. So the objects in merge point to the same objects as the object in 'arr1' and the 
second object in 'arr2', 'world'. However, since the string object 'world' was not mutated, and only the 'hello'
was mutated, then 'arr2' was unchanged while the mutation is reflected in 'arr1'.
When 'arr1' is passed as an argument to the 'p' method, the printed result is '['Jello']'
on line 9, the p method is invoked with variable 'arr2' passed as an argument, printing '['world']'

['Jello', 'world']
['Jello']
['hello']
\
=end

=begin
on line 9 'short_long_short' method is invoked with 2 string objects as arguments, 'abc' and 'defgh'.
The method is defined onlines 1-7. 
Within the method, the string objects are assigned to local variables 'string1' and 'string2'. They still point
to the same object, but with different variable names. 
The string#length method is called on 'string1' returning an integer object that represents the size of the stirng.
This return value is the left operand of the comparison operator '>'. On the right side of the stirng,
the same string#length method is called on 'string2' and its return value is the righ operand of the comparison.
The comparison evaluates both return values and returns a boolean to the if/else conditional.


notes. if you know exactly what the program is going to do, like in these examples where the variables are
explicitly defines, you don't need to go into detail about every possible exectuion flow of the program.
Instead, go into detail about what the program will do and what it will output. And why it will output that. 

=end