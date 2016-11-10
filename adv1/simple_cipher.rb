class Cipher
  attr_reader :key
  
  def initialize(key = nil)
    if key
      raise ArgumentError if key.match(/[A-Z0-9]/) || key.empty?
      @key = key
    else
      generate_key
    end
  end

  def encode(plaintext)
    @plaintext = plaintext
    
    @encoded = plaintext.chars.map.with_index do |char , index|
      difference = key[index].ord - 97
      new_char_ord = (char.ord + difference)
      
      while new_char_ord > 122
        new_char_ord = new_char_ord - 122 + 96
      end
      
      new_char_ord.chr
    end.join("")
  end
  
  def decode(encoded_msg)
    @encoded = encoded_msg
    
    @encoded.chars.map.with_index do |char, index|
      difference = key[index].ord - 97
      new_char_ord = (char.ord - difference)
      
      while new_char_ord < 97
        new_char_ord = new_char_ord - 97 + 123
      end
      
      new_char_ord.chr
    end.join("")
  end
  
  private
  
  def generate_key
    @key = ""
    120.times { |n| @key += ("a".."z").to_a.sample }
    key    
  end
end
