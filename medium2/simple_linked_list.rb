class Element
  attr_reader :datum, :next
  
  def initialize(datum, _next = nil)
    @datum = datum
    @next = _next
  end
  
  def tail?
    !!datum
  end
  
end

class SimpleLinkedList
  attr_reader :list
  
  def initialize(list = [])
    @list = list
  end

  def self.from_a(_list)
    simple_list = SimpleLinkedList.new
    _list.reverse_each { |number| simple_list.push(number) } if _list
    simple_list
  end
  
  def size
    list.size
  end
  
  def empty?
    list.empty?
  end
  
  def head
    list.last
  end
  
  def to_a
    list.map(&:datum).reverse
  end
  
  def push(ele)
    list.push(Element.new(ele, head))
  end
  
  def pop
    @list.pop.datum
  end
  
  def peek
    return nil if @list.last.nil?
    list.last.datum
  end
  
  def reverse
    @list.reverse!
  end
end

 p list = SimpleLinkedList.from_a([1, 2])
 p list.head
 
  #  list_r = list.reverse

#  p   list_r.peek # assert_equal 2,
# p   list_r.head.next.datum  #   assert_equal 1,
 #  p list_r.head.next.tail?