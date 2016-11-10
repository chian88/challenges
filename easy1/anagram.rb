class Anagram
  def initialize(word)
    @word = word.downcase
  end
  
  def match(choices)
    choices.select do |choice| 
      choice.downcase.chars.sort == @word.chars.sort 
    end.delete_if { |choice| choice.downcase == @word }
  end
end
