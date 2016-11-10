require 'pry'
class OCR
  
  def initialize(text)
    
    @text = text.split("\n")
    
    binding.pry
    
  end
  
  def convert
    
  end
  
  
end

  text = <<-NUMBER.chomp
 _
| |
|_|

    NUMBER
    
 p   OCR.new(text).convert