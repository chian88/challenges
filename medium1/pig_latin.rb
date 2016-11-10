class PigLatin
  def self.translate(string)
    
    string.split.map do |word|
      case
      when word.match(/^(squ|thr|sch)/) then replace_consonant_three(word)
      when word.match(/^(ch|qu|th)/) then replace_consonant_two(word)
      when word.match(/^(ye|xe)/) then replace_consonant_one(word)
      when word.match(/^(yt|xr)/) then replace_consonant_none(word)  
      when word.match(/^[aeiou]/) then replace_vowel(word)
      when word.match(/^[^aeiou]/) then replace_consonant_one(word)
      end
    end.join(' ')
  end
  
  
  def self.replace_vowel(string)
    string << "ay"
  end
  
  def self.replace_consonant_one(string)
    string << string.slice!(0,1) + "ay"
  end
  
  def self.replace_consonant_two(string)
    string << string.slice!(0,2) + "ay"
  end
  
  def self.replace_consonant_three(string)
    string << string.slice!(0,3) + "ay"
  end
  
  def self.replace_consonant_none(string)
    string << "ay"
  end
  
end