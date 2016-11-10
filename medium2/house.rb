require 'pry'
class House

  def self.recite
    house = House.new
    house.recite
  end
  
  def recite
    song_pieces = pieces.reverse
    built_up_song = []
    1.upto(song_pieces.size) { |idx|  built_up_song << song_pieces.take(idx) }

    text_song = ''
    
    built_up_song.each_with_index do |phrase, index_p|
      text_song << "This is " + phrase.last.first
      phrase.size == 1 ? text_song << ".\n" : text_song << "\n"
      size = phrase.size-2  
      size.downto(0) do |current| 
        _next = current + 1
        text_song << phrase[_next].last + " " + phrase[current].first
        current.zero? ? text_song << ".\n"  : text_song << "\n"
      end
      text_song << "\n"
    end
    text_song.strip << "\n"
  end

  private

  def pieces
    [
      ['the horse and the hound and the horn', 'that belonged to'],
      ['the farmer sowing his corn', 'that kept'],
      ['the rooster that crowed in the morn', 'that woke'],
      ['the priest all shaven and shorn', 'that married'],
      ['the man all tattered and torn', 'that kissed'],
      ['the maiden all forlorn', 'that milked'],
      ['the cow with the crumpled horn', 'that tossed'],
      ['the dog', 'that worried'],
      ['the cat', 'that killed'],
      ['the rat', 'that ate'],
      ['the malt', 'that lay in'],
      ['the house that Jack built']
    ]
  end
end

puts House.recite