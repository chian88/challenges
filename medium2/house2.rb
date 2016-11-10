require 'pry'
class House
  def self.recite
    new.recite
  end
  
  def recite
    verse1 = (1..pieces.size).map do |number| 
                pieces.last(number)
              end
              
              
    verse2 = verse1.map do |pieces| 
                combine_pieces(pieces)
              end
              
    verse3 = verse2.join("\n\n")
    
    verse3 + "\n"
  end
  
  def combine_pieces(pieces)
    paragraph = pieces.map do |piece| 
      binding.pry
      piece.join("\n") 
    end.join(" ")
    
    "This is #{paragraph}."
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