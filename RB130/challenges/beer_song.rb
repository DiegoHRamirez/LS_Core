class BeerSong
  def self.verses(start, stop)
    strings = []
    start.downto(stop) do |bottles|
      strings << verse(bottles)
    end
    strings.join("\n")
  end

  def self.verse(bottles)
    if bottles == 1
      "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around," \
      "no more bottles of beer on the wall.\n"
    elsif bottles == 0
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more,"\
      "99 bottles of beer on the wall.\n"
    elsif bottles == 2
      "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around,"\
      "1 bottle of beer on the wall.\n"
    else
      "#{bottles} bottles of beer on the wall"\
      "#{bottles} bottles of beer.\n" \
      "Take one down and pass it around,"\
      "#{bottles - 1} bottles of beer on the wall.\n"
    end
  end

  def self.lyrics
    verses(99, 0)
  end
end
