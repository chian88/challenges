module LargeSmall
  def initialize(palindromes)
    @palindromes = palindromes
  end 

  def factors
    @palindromes.select { |pair| pair.reduce(:*) == @result }
  end
end

class Largest 
  include LargeSmall
  
  def value
    @result = @palindromes.map { |pair| pair.reduce(:*) }.max
  end
end

class Smallest
  include LargeSmall

  def value
    @result = @palindromes.map { |pair| pair.reduce(:*) }.min
  end
end

class Palindromes
  def initialize(args)
    @max_factor = args[:max_factor]
    @min_factor = args[:min_factor] || 1
  end
  
  def generate
    product_pairs = (@min_factor..@max_factor).to_a.repeated_combination(2)
    @palindromes = product_pairs.select do |pair|
      result = pair.reduce(:*)
      result.to_s == result.to_s.reverse
    end
  end
  
  def largest
    Largest.new(@palindromes)
  end
  
  def smallest
    Smallest.new(@palindromes)
  end
end
