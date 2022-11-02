adjectives = %w(quick lazy sleepy ugly)
nouns = %w(fox dog head leg)
verbs = %w(jumps lifts bites licks)
adverbs = %w(easily lazily noisily excitedly)

text = File.read('sample.txt')

words_per_line = 0

text.split.each do |word|
  words_per_line += 1
  end_char = word[-1] if word[-1].count('\'.,!?') > 0
  word = word.gsub(/[\'.,!?]/, '') if !!end_char

  case word
  when '%{adjective}' then print adjectives.shuffle!.first
  when '%{noun}' then print nouns.shuffle!.first
  when '%{verb}' then print verbs.shuffle!.first
  when '%{adverb}' then print adverbs.shuffle!.first
  else print word
  end

  print end_char if !!end_char
  print " "
  puts "\n" if words_per_line % 7 == 0 || words_per_line == text.split.size
end



