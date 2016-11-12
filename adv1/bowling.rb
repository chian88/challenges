class Game
  attr_reader :frame_num, :frames
  
  def initialize
    @frames = Array.new(10) { [] }
    @frame_num = 0
    @game_finish = false
  end
  
  def roll(pins)
    current_frame = frames[frame_num]
    
    check_game_finish!
    
    check_pin_value(pins)
    
    if final_frame?(frame_num)
      case
      when current_frame_throws?(0)
        current_frame << pins 
      when current_frame_throws?(1)
        current_frame << pins 
        @game_finish = true if not_spare?
      when current_frame_throws?(2)
        check_pin_counts(pins)
        current_frame << pins
        @game_finish = true
      end
    end
    
    if !final_frame?(frame_num)
      case 
      when strike?(pins)
        current_frame << pins
        increment_frame
      when non_strike?(pins) && current_frame_throws?(0)
        current_frame << pins
      when non_strike?(pins) && current_frame_throws?(1)
        check_pin_errors(pins)
        current_frame << pins
        increment_frame
      end
    end
  end

  def score
    check_game_finish
    
    score = frames.map.with_index do |frame, index|
      next_frames = frames[index+1]
      next_two_frames = frames[index+2]
      
      if strike?(frame.first) && !final_frame?(index)
        case 
        when next_frames.size == 1
          10 + next_frames.first + next_two_frames.first 
        when next_frames.size > 1
          10 + next_frames.first(2).reduce(:+)
        end
      elsif spare?(frame) && !final_frame?(index)   
        10 + next_frames.first
      else                              
        frame.reduce(:+)
      end
    end
    
    score.reduce(:+)
  end
  
  private
  
  def spare?(frame)
    frame.first(2).reduce(:+) == 10
  end
  
  def check_game_finish
    raise RuntimeError, 'Score cannot be taken until the end of the game' unless @game_finish
  end
  
  def current_frame_throws?(times)
    current_frame = @frames[frame_num]
    current_frame.size == times
  end
  
  def not_spare?
    current_frame = @frames[frame_num]
    current_frame.reduce(:+) < 10
  end
  
  def final_frame?(frame_num)
    frame_num == 9
  end
  
  def increment_frame
    @frame_num += 1
  end
  
  def non_strike?(pins)
    (0..9).cover?(pins)
  end
  
  def strike?(pins)
    pins == 10 
  end
  
  def check_game_finish!
    raise RuntimeError, 'Should not be able to roll after game is over' if @game_finish
  end
  
  def check_pin_value(pins)
    unless (0..10).cover?(pins)
      raise RuntimeError, "Pins must have a value from 0 to 10" 
    end
  end
  
  def check_pin_counts(pins)
    current_frame = @frames[frame_num]
    if current_frame.last != 10 && pins + current_frame.last > 10
      raise RuntimeError, 'Pin count exceeds pins on the lane' 
    end
  end
  
  def check_pin_errors(pins)
    current_frame = @frames[frame_num]
    raise RuntimeError, "Pin count exceeds pins on the lane" if (pins + current_frame.first) > 10 
  end
  
end

class RuntimeError < StandardError ; end