class Meetup
  
  def initialize(month, year)
    @month = month
    @year = year
  end
  
  def day(day_week, flag)
    case flag
    when :teenth
      teenth(day_week)
    when :first
      find_day(day_week, 1)
    when :second
      find_day(day_week, 2)
    when :third
      find_day(day_week, 3)
    when :fourth
      find_day(day_week, 4)
    when :last
      last(day_week)
    end
  end
  
  def last(day_week)
    Date.new(@year,@month, -1).downto(Date.new(@year, @month, 1)) do |d|
      return d if d.public_send(day_week.to_s + '?') 
    end
  end
  
  def find_day(day_week, number)
    counter = 0
    Date.new(@year,@month, 1).step(Date.new(@year, @month, -1)) do |d| 
      counter += 1 if d.public_send(day_week.to_s + '?')
      return d if counter == number
    end
  end
  
  def teenth(day_week)
    Date.new(@year,@month, 13).step(Date.new(@year, @month, 19)) do |d| 
      return d if d.public_send(day_week.to_s + '?') 
    end
  end
end

class Meetup2
  def initialize(month, year)
    @month = month
    @year = year
    @schedule_start_day = { 
      first: 1,
      second: 8,
      third: 15,
      fourth: 22,
      last: -7,
      teenth: 13
    }
    
    def day(weekday, schedule)
      first_day = Date.new(@year, @month, @schedule_start_day[schedule])
      (first_day..(first_day + 6)).detect { |day| day.public_send(weekday.to_s + "?") }
    end
  end
end