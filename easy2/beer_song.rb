require 'pry'


class BeerSong
  def verse(number)
    "#{top_line(number)}\n" \
      "#{bottom_line(number)}\n"
  end
  
  def top_line(number)
    case number
    when (2..99)
      "#{number} bottles of beer on the wall, #{number} bottles of beer."
    when 1
      "#{number} bottle of beer on the wall, #{number} bottle of beer."
    when 0
      "No more bottles of beer on the wall, no more bottles of beer."
    end
  end
  
  def bottom_line(number)
    one_less = number - 1
    case one_less
    when (2..98)
      "Take one down and pass it around, #{one_less} bottles of beer on the wall."
    when 1
      "Take one down and pass it around, #{one_less} bottle of beer on the wall."
    when 0
      "Take it down and pass it around, no more bottles of beer on the wall."
    when -1
      "Go to the store and buy some more, 99 bottles of beer on the wall."
    end
  end
  
  def verses(top, down)
    (down..top).map { |number| verse(number) }.reverse.join("\n")
  end
  
  def lyrics
    verses(99, 0)
  end
end

puts BeerSong.new.verse(0)
