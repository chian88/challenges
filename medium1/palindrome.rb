require 'pry'
def palindrome?(word)
  word.downcase!
  letter_only = word.chars.select { |char| ("a".."z").include? char }
  letter_only.reverse_each.with_index do |letter, index|
    return false if letter != letter_only[index]
  end
  return true
end


p palindrome?("romor") == true
p palindrome?("motor") == false
p palindrome?("no1, 3on") == true
p palindrome?("") == true
p palindrome?("i") == true