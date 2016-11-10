require 'pry'
class Clock
  attr_reader :hour, :minute
  
  HOUR_PER_DAY = 24
  MINUTE_PER_HOUR = 60
  
  def self.at(_hour, _minute = 0)
    Clock.new(_hour, _minute)
  end
  
  def initialize(hour, minute)
    @hour = hour
    @minute = minute
  end
  
  def +(local_minute)
    total_minute   = hour * MINUTE_PER_HOUR + minute + local_minute
    _hour, _minute = total_minute.divmod(60)
    _hour         %= 24
    Clock.new(_hour, _minute)
  end
  
  def -(local_minute)
    total_minute   = hour * MINUTE_PER_HOUR + minute - local_minute
    _hour, _minute = total_minute.divmod(60)
    _hour         %= 24
    Clock.new(_hour, _minute)    
  end
  
  def to_s
    "%02d:%02d" % [hour, minute]
  end
  
  def ==(clock_obj)
    hour == clock_obj.hour && minute == clock_obj.minute
  end
end
