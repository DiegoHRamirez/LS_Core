#2nd way to integrate polymorphism - DUCKTYPING : EXAMPLE
class Wedding
  attr_reader :guests, :flowers, :songs
  
  def prepare(preparers)
    preparers.each do |preparer|
      p preparer
      p self
      p (preparer.prepare_wedding(self))
      p '---------------------'
      preparer.prepare_wedding(self)
    end
  end
end

class Chef
  def prepare_wedding(wedding)
    prepare_food(wedding.guests)
  end
  
  def prepare_food(guests)
    puts "FOOD PREPARED"
  end
end

class Decorator
  def prepare_wedding(wedding)
    decorate_place(wedding.flowers)
  end
  
  def decorate_place(flower)
    puts "PLACE DECORATED"
  end
end

class Musician
  def prepare_wedding(wedding)
    prepare_performance(wedding.songs)
  end
  
  def prepare_performance(songs)
    puts "SONG PREPARED"
  end
end

wedding = Wedding.new

wedding.prepare([Chef.new, Decorator.new, Musician.new])



