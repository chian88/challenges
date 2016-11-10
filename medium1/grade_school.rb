require 'pry'
class School
  attr_reader :grader
  
  def initialize
    @grader = Hash.new { |roster, grade| roster[grade] = [] }
  end
  
  def to_h
    grader.sort.map { |grade, list| [grade, list.sort] }.to_h
  end
  
  def add(name, grade)
    grader[grade] << name
  end
  
  def grade(_grade)
    grader[_grade]
  end
end
