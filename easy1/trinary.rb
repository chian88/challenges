class Trinary
  def initialize(trinary_str)
    @num = trinary_str =~ /\A[-+]?[0-7]+\z/ ? trinary_str.chars.map(&:to_i) : [0]
  end
  
  def to_decimal
    sum = 0
    @num.reverse_each.with_index { |num, index| sum += num * (3 ** index) }
    sum
  end
  
end

trinary = Trinary.new('0a1b2c')
p trinary.to_decimal