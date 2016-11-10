class Octal
  def initialize(octal_str)
    @num = octal_str =~ /\A[-+]?[0-7]+\z/ ? octal_str.chars.map(&:to_i) : [0]
  end
  
  def to_decimal
    sum = 0
    @num.reverse_each.with_index { |int, index| sum += int * 8 ** index }
    sum
  end
end

octal = Octal.new("233")
p octal.to_decimal