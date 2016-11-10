class Simulator
  DIRECTIONS = {'L' => :turn_left, 'R' => :turn_right, 'A' => :advance}
  
  def instructions(string)
    string.chars.map! { |char| DIRECTIONS[char] }
  end
  
  def place(robot, directions )
    robot.orient(directions[:direction])
    robot.at(directions[:x], directions[:y])
  end
  
  def evaluate(robot, command)
    list_of_command = instructions(command)
    list_of_command.each { |command| robot.send(command.to_s) }
  end
  
end






class Robot
  POSSIBLE_DIRECTION = [:east, :west, :north, :south].freeze
  
  attr_reader :bearing, :coordinates
  
  def orient(direction)
    raise ArgumentError unless POSSIBLE_DIRECTION.include?(direction)
    @bearing = direction
  end
  
  def advance
    @coordinates = case bearing
                   when :east  then [coordinates[0] + 1, coordinates[1]] 
                   when :west  then [coordinates[0] - 1, coordinates[1]] 
                   when :north then [coordinates[0], coordinates[1] + 1] 
                   when :south then [coordinates[0], coordinates[1] - 1] 
                   end    
  end
  
  def at(x, y)
    @coordinates = [x, y]
  end
  
  def turn_right
    @bearing = case bearing
               when :east  then :south
               when :west  then :north
               when :north then :east
               when :south then :west
               end
  end
  
  def turn_left
    @bearing = case bearing
               when :east  then :north
               when :west  then :south
               when :north then :west
               when :south then :east
               end
  end
  
end