def odd_word(sentence)
  return "" if sentence.empty?
  new_sentence = ""
  sentence = sentence.gsub(".", "").split
  sentence.each_with_index do |word, idx|
    if idx % 2 == 0 # even
      word.length.times { |n| new_sentence << word[n] }
      new_sentence << " " unless idx >= sentence.length - 1
    else # odd
      (word.length-1).downto(0) { |n| new_sentence << word[n] }
      new_sentence << " " unless idx >= sentence.length - 1
    end
  end
  new_sentence << "."
end

sentence = "hello      word     world  ."
puts odd_word(sentence)