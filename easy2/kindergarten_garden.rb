require 'pry'
class Garden
  VEGETABLES = { "G" => :grass , "C" => :clover, "R" => :radishes, "V" => :violets }
  STUDENTS = %w(Alice Bob Charlie David Eve Fred Ginny Harriet Ileana Joseph Kincaid Larry)
  
  def initialize(garden, students = STUDENTS)
    @students = students.sort
    @garden = []
    garden.split(/\n/).each do |line|
      line.chars.each_slice(2) { |chunk| @garden << chunk }
    end
  end
  

  def extract_vegetables(index)
    array = []
    increment = @garden.size / 2
    array << VEGETABLES[@garden[index][0]] 
    array << VEGETABLES[@garden[index][1]] 
    array << VEGETABLES[@garden[index+increment][0]]
    array << VEGETABLES[@garden[index+increment][1]]
    array
  end
  
  def alice
    index = @students.find_index("Alice")
    extract_vegetables(index)
  end
  
  def bob
    index = @students.find_index("Bob")
    extract_vegetables(index)
  end
  
  def charlie
    index = @students.find_index("Charlie")
    extract_vegetables(index)
  end
  
  def david
    index = @students.find_index("David")
    extract_vegetables(index)
  end
  
  def eve
    index = @students.find_index("Eve")
    extract_vegetables(index)
  end

  def fred
    index = @students.find_index("Fred")
    extract_vegetables(index)
  end
  
  def ginny
    index = @students.find_index("Ginny")
    extract_vegetables(index)
  end
  
  def harriet
    index = @students.find_index("Harriet")
    extract_vegetables(index)
  end
  
  def ileana
    index = @students.find_index("Ileana")
    extract_vegetables(index)
  end
  
  def joseph
    index = @students.find_index("Joseph")
    extract_vegetables(index)
  end
  
  def kincaid
    index = @students.find_index("Kincaid")
    extract_vegetables(index)
  end
  
  def larry
    index = @students.find_index("Larry")
    extract_vegetables(index)
  end
  
  def patricia
    index = @students.find_index("Patricia")
    extract_vegetables(index)    
  end
  
  def samantha
    index = @students.find_index("Samantha")
    extract_vegetables(index)    
  end
  
  def roger
    index = @students.find_index("Roger")
    extract_vegetables(index)
  end
  
  def xander
    index = @students.find_index("Xander")
    extract_vegetables(index)    
  end
 
end
