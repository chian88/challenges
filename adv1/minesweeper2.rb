class ValueError < StandardError ; end

class Board
  def self.transform(input)
    validate_input(input)
    output = Array.new(input.size) { Array.new(input[0].size) }
    
    input.each_with_index do |row, x|
      row.chars.each_with_index do |char, y|
        if char == " "
          number_of_mines = number_of_surrounding_mines(x, y, input)
          if number_of_mines == 0
            output[x][y] = " "
          else
            output[x][y] = number_of_mines.to_s
          end
        else
          output[x][y] = char
        end

      end
    end
    output.map(&:join)
  end
  
  def self.number_of_surrounding_mines(x, y, input)
    [input[x-1][y-1], input[x-1][y], input[x-1][y+1], input[x][y-1], 
     input[x][y+1], input[x+1][y-1], input[x+1][y], input[x+1][y+1]].count("*")
    
  end
  
  def self.validate_input(input)
    raise ValueError, "Input needs to have rows of the same length" unless rows_of_the_same_length?(input)
    raise ValueError, "Invalid board pattern" unless valid_board_pattern(input)
  end
  
  def self.rows_of_the_same_length?(input)
    input.all? { |row| row.size == input[0].size }
  end
  
  def self.valid_board_pattern(input) 
    first_row , last_row = input[0] , input[-1]
    first_row.match(/^\+-*\+$/) && last_row.match(/^\+-*\+$/) && input[1..-2].all? { |row| row.match(/^\|(\*|\ )*\|$/) }
 
    
  end
end
