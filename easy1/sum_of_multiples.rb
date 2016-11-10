require 'pry'
class SumOfMultiples
  
  def initialize(*multiples)
    @multiples = multiples
  end
  
  def self.to(limit, multiple= [3,5])
    sum = (0...(limit)).to_a.select do |num|
      multiple.any? {|multiple| num % multiple == 0 }
    end.reduce(:+)
  end
  
  def to(limit)
    self.class.to(limit, @multiples)
  end
end


class SumOfMultiples2
  def self.to(limit, multiples = [3,5])
    (0...limit).select do |number|
      multiples.any? { |multiple| number % multiple == 0 }
    end.reduce(:+)
    
    def initialize(*multiples)
      @multiples = multiples
    end
    
    def to(limit)
      self.class.to(limit, @multiples)
    end
  end

  def initialize(*multiples)
    @multiples = multiples
  end
end

p SumOfMultiples.new(4, 6).to(15)
p SumOfMultiples.new(5, 6, 8).to(150)
p SumOfMultiples.to(10)