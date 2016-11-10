class Fixnum
  ROMAN_NUMERAL_RULES = 
  { 'M' => 1000,
    'CM' => 900,
    'D' => 500,
    'CD' => 400,
    'C' => 100,
    'XC' => 90,
    'L' => 50,
    'XL' => 40,
    'X' => 10,
    'IX' => 9,
    'V' => 5,
    'IV' => 4,
    'I' => 1 }
  
  
  def to_roman
    roman_numeral = ""
    divisible = self
    ROMAN_NUMERAL_RULES.each do |letter, value|
      multiple, remainder = divisible.divmod(value)
      roman_numeral << letter * multiple
      divisible = remainder
    end
    roman_numeral
  end
  
end