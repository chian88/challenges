require 'pry'

class PerfectNumber
  
  def self.classify(number)
    raise RuntimeError if number <= 0
    sum = sum_of_factors(number)
    case
    when sum == number then "perfect"
    when sum > number then "abundant"
    when sum < number then "deficient"
    end
  end

  def self.sum_of_factors(number)
    factors = (1...number).select { |n| number % n == 0 }
    sum_of_factors = factors.reduce(:+)
  end
  
end

class PerfectNumber2
  def self.classify(number)
    raise RuntimeError if number < 0

    factors = (1...number).select { |num| number % num == 0 }

    result = factors.reduce(:+)

    case
      when result < number then 'deficient'
      when result > number then 'abundant'
      when result == number then 'perfect'
    end
  end
end