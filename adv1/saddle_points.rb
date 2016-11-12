require 'pry'
class Matrix
  attr_reader :rows, :columns
  
  def initialize(string)
    @rows = string.split("\n").map { |row| row.split(" ").map(&:to_i) }
    @columns = rows.transpose
  end
  
  def saddle_points
    saddle = []
    rows.each_with_index do |row, index_r|
      columns.each_with_index do |column, index_c|
        saddle << [index_r, index_c] if row.max == column.min
      end
    end
    saddle
  end
  
end

 
matrix = Matrix.new("2 1\n1 2")
p matrix.saddle_points  #     assert_equal [],

# matrix = Matrix.new("18 3 39 19 91\n38 10 8 77 320\n3 4 8 6 7")
# p matrix.rows
# p matrix.columns

#     matrix.saddle_points  # assert_equal [[2, 2]]
