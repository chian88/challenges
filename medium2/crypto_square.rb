require 'pry'
class Crypto
  def initialize(raw_string)
    @raw_string = raw_string
  end
  
  def normalize_plaintext
    @word = @raw_string.downcase.gsub(/[^0-9a-z]/, "" )
  end
  
  def size
    normalize_plaintext
    @column = Math.sqrt(@word.size).ceil
  end
  
  def plaintext_segments
    size
    @encrypted = @word.scan(/.{1,#{@column}}/)
  end
  
  def ciphertext
    plaintext_segments
    @ciphered = ""
    @column.times do |index|
      @encrypted.each { |block| @ciphered += block[index] unless block[index].nil? }
    end
    @ciphered
  end
  
  def normalize_ciphertext
    ciphertext
    @normalized = ""
    slices, remainder = @ciphered.size.divmod(@column)
    until @ciphered.empty?
      if remainder > 0
        @normalized << @ciphered.slice!(0,slices+1) 
        remainder -= 1
      else
        @normalized << @ciphered.slice!(0,slices)
      end
      @normalized << " "
    end
    @normalized.strip
  end
end

