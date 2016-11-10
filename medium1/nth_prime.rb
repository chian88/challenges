class Prime
  def self.nth(max_size)
    raise ArgumentError if max_size.zero?
    candidate = 3
    @primes = [2]
    while @primes.size < max_size
      @primes << candidate if prime?(candidate)
      candidate += 2  
    end
    @primes.last
  end
   
  def self.prime?(candidate)
    @primes.each do |prime|
      return false if candidate % prime == 0
      break true if prime > Math.sqrt(candidate)
    end
  end
end
 
