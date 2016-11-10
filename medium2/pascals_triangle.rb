require 'pry'
class Triangle2
  def initialize(max_row)
    @pascal = []
    max_row.times { |idx| @pascal << Array.new(idx + 1, 1) }
  end
  
  def rows
    @pascal.map!.with_index do |row, index_row|
      row.map.with_index do |ele, index_ele|
        next ele if index_ele == 0 || index_ele == (row.size - 1)
        ele = @pascal[index_row-1][index_ele] + @pascal[index_row-1][index_ele-1]
      end
    end
  end
end

class Triangle
  attr_reader :rows

  def initialize height
    @rows = (1..height).map do
      next_row 
    end
  end

  private

  def next_row
    bottom_row = @previous_row ? [0, *@previous_row, 0] : [0, 1]
    @previous_row = bottom_row.each_cons(2).map { |left, right| left + right }
  end
end

triangle = Triangle.new(4)
triangle.rows.last
