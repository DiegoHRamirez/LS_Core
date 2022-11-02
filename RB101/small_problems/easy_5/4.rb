=begin
given a string of words separated by spaces, write a method that takes this string of words and returns a string in which
the first and last letter of every word are swapped.

Assume that every word contains at least one letter, and the string will always contain at least one word.

input: sentence string
output : new string, with every first and last letter in every word swapped.

ex: 'this is a string' => 'shit si a gtrins'

data structure = use arrays

algorithm:
set variable string equal to the string object passed into the method
set word_array equal to the result of splitting the string object into an array of just words with no spaces
set variable object 'words_swapped' equal to an empty array
iterate over every element in words_array
save the object at index 0 of the element equal to variable first_letter
set the object at index -1 of the element equal to variable last_letter
set the object at index 0 of th element equal to variable last_letter
set the object at index -1 of the element equal to last_letter
append the swapped string object to the word_swapped array

join the elements in the sqapped-words array with a delimiter ' '
return the new array

def swap(string)
   swapped_words  =   string.split.map do |word|
                        if word.size >= 2
                          first_letter  = word[0]
                          last_letter = word[-1]
                          word[0] = last_letter
                          word[-1] = first_letter
                          word
                        else
                          word
                        end
                      end
  swapped_words.join(' ')
end

=end

def swap_first_last_characters(word)
  word[0], word[-1] = word[-1], word[0]
  word
end

def swap(words)
  result = words.split.map do |word|
    swap_first_last_characters(word)
  end
  result.join(' ')
end

p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'

