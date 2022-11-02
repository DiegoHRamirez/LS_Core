module SoundSystem
  def play_music # play_music method that was not applicable to the `Motorcycle` class extracted to module `Playable`
    "PLAYING MUSIC!"
  end
end

module Playable
  include SoundSystem
end

class Transportation
end

class Motorcycle < Transportation
end

class Car < Transportation
  include Playable

  def play_music
    super + " from car"
  end
end

class Laptop
  include Playable
end

p Car.new.play_music
p Laptop.new.play_music
