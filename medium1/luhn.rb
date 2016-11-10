require 'pry'
class Luhn
  attr_accessor :numbers
  
  def self.create(number_ori)
    luhn = Luhn.new(number_ori)
    10.times do |number|
      luhn = Luhn.new(number_ori)
      luhn.numbers << number
      break if luhn.valid?
    end
    luhn.numbers.join.to_i
  end
  
  def initialize(number)
    @numbers = number.to_s.chars.map(&:to_i)
    @converted_numbers = []
  end
  
  def addends
    @numbers.reverse_each.with_index do |number, index|
      number = (number * 2) % 9 if index.odd? && number != 9
      @converted_numbers.unshift(number)
    end
    @converted_numbers
  end
  
  def checksum
    addends
    @converted_numbers.reduce(:+)
  end
  
  def valid?
    (checksum % 10).zero? ? true : false
  end
end

