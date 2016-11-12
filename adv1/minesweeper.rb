class Board
  def self.transform(input)
    
    
    lengths = input.map { |row| row.length }
    raise ValueError if lengths.uniq.count > 1
    
    input.map!.with_index do |row, index_r|
      raise ValueError if index_r == 0 && row.match(/[^+-]/)
      raise ValueError if index_r == (input.size-1) && row.match(/[^+-]/)
      row.chars.map!.with_index do |ele, index_e|
        result = 0
        if ele != " "
          ele
        else
          if input[index_r-1]
            result += 1 if input[index_r-1][index_e-1] && input[index_r-1][index_e-1] == "*"
            result += 1 if input[index_r-1][index_e] == "*"
            result += 1 if input[index_r-1][index_e+1] && input[index_r-1][index_e+1] == "*"
          end
          
          result += 1 if input[index_r][index_e-1] && input[index_r][index_e-1] == "*"
          result += 1 if input[index_r][index_e+1] && input[index_r][index_e+1] == "*"
          
          if input[index_r+1]
            result += 1 if input[index_r+1][index_e-1] && input[index_r+1][index_e-1] == "*"
            result += 1 if input[index_r+1][index_e] == "*"
            result += 1 if input[index_r+1][index_e+1] && input[index_r+1][index_e+1] == "*"
          end
          result.zero? ? " " : result
        end
      end.join("")
    end
  end
end

class ValueError < StandardError ; end

