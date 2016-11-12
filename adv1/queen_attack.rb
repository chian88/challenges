class Queens
  attr_reader :board, :white, :black
  
  def initialize(position = {})

    @board = Array.new(8) { Array.new(8, "_") }
    @white = position[:white] || [0, 3]   # [vertical, horizontal]
    @black = position[:black] || [7, 3]
    raise ArgumentError if white == black
  end
  
  def to_s
    board[white.first][white.last] = "W"
    board[black.first][black.last] = "B"
    board.map { |col| col.join(" ") }.join("\n")
  end
  
  def attack?
    horizontal? || vertical? || diagonal?
  end
  
  private
  
  def horizontal?
    white.last == black.last
  end
  
  def vertical?
    white.first == black.first
  end
  
  def diagonal?
    (white.first - black.first).abs == (white.last - black.last).abs
  end
end

class ArgumentError < StandardError ; end

