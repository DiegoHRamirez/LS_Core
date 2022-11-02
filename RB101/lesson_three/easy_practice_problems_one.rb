=begin

#question 1
calling Array#uniq method returns a new array, removing duplicate values
however, it does not mutate original,
puts outputs:
1
2
2
3

#question 2
1. != means it is 'not equal'. Can be used to compare two valus that are not equal in conditional statements
2. The ! returns the opposite boolean value of the variable it is added before
so !user_name means 'not username', if user_name's boolean value is true, !user_name returns falase
3. methods that end with a '!' usually indicate destructive methods,
4. ? : is the ternary operator for if..else
5. A '?' after a method indicates that the method that returns a boolean value
6. double '!' usually cancel each other out, double negative situation

#question 3
advice.gsub!(/important/, 'urgent')

#q4
#delete method deletes the element specified in argument
#delete_at method deletes element at specified infex in argument

#5
42 in 10..100  => true

#6
New string: real_words = "four score and " << famous_words
famouse_words.prepend("four score and ")

#q7
flintstones.flatten!

#q8
flintstones.assoc("Barney")

