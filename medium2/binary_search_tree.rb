class Bst
  attr_accessor :current_index
  
  def initialize(original_num)
    @binary = [original_num]
    @current_index = 0
  end
  
  def data
    @binary[@current_index]
  end
  
  def left
    @current_index -= 1
    self
  end
  
  def right
    @current_index += 1
    self
  end
  
  def insert(new_num)
    if new_num < data
      @current_index += 1
    end
    @binary << new_num
    @binary.sort!
  end
  
end

four = Bst.new 4     # [1,2,3,4,5,6,7,]
    four.insert 2    #current_index 0 , 1 ,2, 3
    four.insert 6
    four.insert 1
    four.insert 3
    four.insert 7
    four.insert 5
    p four.current_index
p  four.data # 4
p four.left.data #2
p  four.left.left.data # 1

  four.left.right.data  # 3
 four.right.data  # 6
 four.right.left.data  # 5
 four.right.right.data  # 7