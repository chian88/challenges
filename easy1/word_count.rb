class Phrase2
  def initialize(sentence)
    @sentence = sentence
  end
  
  def word_count
    @count = Hash.new(0)
    @sentence.split(/[^0-9a-z']/i).each do |word|
      word.gsub!("'", "") if word.count("'") == 2
      @count[word.downcase] += 1 
  
    end
    @count.delete_if { |k, _| k == "" } 
  end
  
end


class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    words_in_phrase.each_with_object(Hash.new(0)) do |word, results|
      results[word] += 1
    end
  end

  private

  def words_in_phrase
    @phrase.downcase.scan(/\w+'\w+|\w+/)
  end
end