class CircularBuffer
  attr_reader :max, :array
  
  def initialize(max)
    @max = max
    @array = []
  end
  
  def read
    last_element = array.shift
    raise BufferEmptyException if last_element.nil?
    last_element
  end
  
  def write(element)
    return if element.nil?
    raise BufferFullException if array.size >= max
    array << element 
  end
  
  def write!(element)
    return if element.nil?
    array.shift if array.size >= max
    array << element 
  end
  
  def clear
    array.clear
  end
  
  class BufferEmptyException < StandardError ; end
  class BufferFullException < StandardError ; end
end



