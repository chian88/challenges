require 'pry'
class Series
  def initialize(string)
    @number_array = string.chars
  end
  
  def slices(size)
    raise ArgumentError, "you are asking too much" if size > @number_array.size
    sliced_array = []
    @number_array.each_cons(size) do |chunk|
      sliced_array << chunk.map(&:to_i)
    end
    sliced_array
  end
end
