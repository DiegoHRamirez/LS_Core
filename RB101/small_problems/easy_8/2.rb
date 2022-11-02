def madlibs()
  arguments = %w(noun verb adjective adverb)
  choices = {}

  arguments.each do |type|
    print "Enter a #{type}: "
    choices[type] = gets.chomp
  end

  puts "\nDo you #{choices['verb']} your #{choices['adjective']} #{choices['noun']} #{choices['adverb']}? That's hilarious!"
end

madlibs()