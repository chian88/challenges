require 'pry'
class RunLengthEncoding2
  def self.encode(input)
    output = ""
    temp = []
    input.each_char.with_index do |current, index|
      if current == input[index+1]
        temp << current
      elsif temp.size > 0
        output << "#{temp.count+1}#{current}"
        temp.clear
      else temp.size == 0
        output << current
      end
    end
    output
  end
  
  def self.decode(input)
    word_array = input.scan(/(\d+[^\d]{1}|[^\d]{1})/i).flatten
    word_array.map! do |word|
      if word.match(/[\d]/)
        word[-1] * word[0...-1].to_i
      else
        word[-1]
      end
    end
    word_array.join("")
  end
end

module RunLengthEncoding
  def self.encode(input)
    binding.pry
    input.gsub(/(.)\1{1,}/) { |match| match.size.to_s + match[0] }
  end

  def self.decode(input)
    input.gsub(/\d+\D/) { |match| match[-1] * match.to_i }
  end
end