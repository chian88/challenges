class DNA
  def initialize(dna1)
    @dna1 = dna1
  end
  
  def hamming_distance(dna2)
    counter = 0
    @dna1.chars.each_with_index do |char1, index|
      counter += 1 if dna2[index] && char1 != dna2[index]
    end
    counter
  end
end

class DNA2
  def initialize(strand)
    @strand = strand
  end
  
  def hamming_distance(strand2)
    strand1 = @strand[0, strand2.length]
    
    strand1.chars.zip(strand2.chars).count { |pair| pair.first != pair.last }
  end
end

class DNA3
  def initialize(strand1)
    @strand1 = strand1
  end
  
  def hamming_distance(strand2)
    distance = 0
    min , max = [@strand1, strand2].sort_by(&:size)
    min.each_char.with_index do |char, index|
      distance += 1 unless char == max[index]
    end
    
    distance
  end
end

class DNA4
  def initialize(strand)
    @strand = strand
  end
  
  def hamming_distance(other)
    length = [@strand.size, other.size].min - 1
    
    (0..length).reduce(0) do |distance, index|
      @strand[index] == other[index] ? distance : distance + 1
    end
    
  end
  
end