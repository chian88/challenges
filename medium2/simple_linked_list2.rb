class Element
  attr_reader :datum 
  
  def initialize(datum, _next = nil)
    @datum = datum
    @next = _next
  end
  
  def tail? 
    @next.nil?
  end
  
  def next
    @next
  end
end

class SimpleLinkedList
  attr_reader :simple_list
  
  def initialize
    @simple_list = []
  end
  
  def size
    simple_list.size
  end
  
  def empty?
    simple_list.empty?
  end
  
  def push(number)
    simple_list.unshift(Element.new(number, head))
  end
  
  def peek
    return nil if simple_list.first.nil?
    simple_list.first.datum
  end
  
  def head
    return nil if simple_list.first.nil?
    simple_list.first
  end
  
  def pop
    simple_list.shift.datum
  end
  
  def self.from_a(array)
    list = SimpleLinkedList.new
    array.reverse_each { |number| list.push(number) } if array
    list
  end
  
  def to_a
    simple_list.map(&:datum)
  end
  
  def reverse
    array = self.to_a
    list = SimpleLinkedList.new
    array.each { |number| list.push(number) } if array
    list
  end
  
end
