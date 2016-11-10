class PhoneNumber
  attr_reader :clean_string
  
  INVALID = '0000000000'
  
  def initialize(num_string)
    @clean_string = num_string.gsub(/[^a-z0-9]/i, "")
  end
  
  def number
    return INVALID if clean_string.match(/[a-z]/i)
    return INVALID if clean_string.size <= 9 || @clean_string.size >= 12
    if clean_string.size == 11 && clean_string[0] == "1"
      clean_string.slice!(0)
    elsif clean_string.size == 11
      return INVALID
    end
    clean_string
  end
  
  def area_code
    final = number
    final.slice(0,3)
  end
  
  def to_s
    final = number
    "(#{final[0..2]}) #{final[3..5]}-#{final[6..9]}"
  end
  
end