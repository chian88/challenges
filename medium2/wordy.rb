require 'pry'
class WordProblem
  OPERATOR = { 'plus' => '+', 'minus' => '-', 'multiplied' => '*' , 'divided' => '/' }
  
  def initialize(string)
    string.gsub!("?", "")
    @words = string.split(" ")
    
  end
  
  def answer
    number_array = convert_to_num_array
    sum = 0
    counter = 0
    loop do
      raise ArgumentError unless number_array[counter+2]
      if counter == 0
        sum = number_array[counter].send(number_array[counter+1], number_array[counter+2]) 
      else
        sum = sum.send(number_array[counter], number_array[counter+1])
      end
      
      counter += 3
      break unless number_array[counter]
    end
    sum
  end
  
  def convert_to_num_array
    number_array = []
    @words.each do |word|
      if word.to_i.to_s == word #this is numbers
        number_array << word.to_i
      elsif OPERATOR[word]
        number_array << OPERATOR[word]
      end
    end
    number_array
  end
end
