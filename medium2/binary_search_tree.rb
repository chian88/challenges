class Bst
  def initialize(number)
    @tree = [[number]]
  end
  
  def insert(number)
    if require_branch? && smaller?
      @tree << [        ]
      
    elsif require_branch? && bigger?
      
      
    end
  end
  
  def require_branch?
    index = @tree.size - 1
    return true if index == 0
    @tree.last.size == index
  end
end