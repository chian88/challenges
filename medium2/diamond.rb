class Diamond
  def self.make_diamond(letter)
    size = (("A"..letter).to_a.size  * 2 ) - 1  # 3 letter => 5 rows
    down_index = size/2
    up_index = size/2
    diamond = ""
    
    ("A"..letter).each do |char|
      string = ''
      string = string.center(size)
      string[up_index] = char
      string[down_index] = char
      diamond << string + "\n"
      up_index += 1
      down_index -= 1
    end
    
    up_index -= 1
    down_index += 1
    
    ("A"...letter).to_a.reverse_each do |char|
      up_index -= 1
      down_index += 1
      string = ''
      string = string.center(size)
      string[up_index] = char
      string[down_index] = char
      diamond << string + "\n"
    end
    diamond
  end
end

puts Diamond.make_diamond("C")
  
