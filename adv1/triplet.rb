require 'pry'
class Triplet
  
  def initialize(a, b, c)
    @side_a = a
    @side_b = b
    @side_c = c
  end
  
  def sum
    @sum = @side_a + @side_b + @side_c
  end
  
  def product
    @product = @side_a * @side_b * @side_c
  end
  
  def pythagorean?
    triangle = [@side_a, @side_b, @side_c].sort.reverse
    triangle.map { |num| num**2 }.reduce(:-) == 0 
  end
  
  def self.pythagorean?(a, b ,c)
    triangle = [a, b, c].sort.reverse
    triangle.map { |num| num**2 }.reduce(:-) == 0 
  end
  
  def self.where(hash)
    min = hash.fetch(:min_factor, 1)
    max = hash.fetch(:max_factor, 1)
    sum = hash.fetch(:sum, nil)
    permutation = (min..max).to_a.repeated_combination(3).to_a
    triangles = permutation.select do |triangle| 
      sum ? pythagorean?(*triangle) && triangle.reduce(:+) == sum : pythagorean?(*triangle) 
    end
    triangle_obj = triangles.map { |triangle|  Triplet.new(*triangle) }
  end
  
end


