class Sieve2
  def initialize(limit)
    @limit = limit
    @non_prime = []
  end
  
  def primes
    prime = []
    (2..@limit).each do |candidate|
      next if @non_prime.include? candidate
      prime << candidate
      generate_non_prime(candidate)
    end
    prime
  end
  
  def generate_non_prime(prime)
    (prime..@limit).step(prime) { |multiple| @non_prime << multiple } 
  end
end


class Sieve
  def initialize(number)
    raise ArgumentError if number.class != Fixnum || number < 2
    @num_arr = (2..number).to_a
  end
  
  def primes
    primes = []
    numbers = @num_arr.clone
    until numbers.empty?
      primes << numbers.shift
      numbers.delete_if { |num| num % primes.last == 0 } 
    end
    primes
  end
  
end