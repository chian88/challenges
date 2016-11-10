class SecretHandshake
  HANDSHAKE_CODE = { 8 => 'jump', 4 => 'close your eyes' , 2 => 'double blink', 1 => 'wink' }
  
  
  def initialize(decimal)
    @decimal = decimal.to_i
  end
  
  
  def commands
    @reverse = -1  # -1 means no
    while @decimal >= 16
      @reverse *= -1
      @decimal -= 16
    end
    decrypt
  end
  
  def decrypt
    handshake = []
    HANDSHAKE_CODE.each do |divisor, hand_shake|
      mult, remainder = @decimal.divmod(divisor)
      if @reverse < 0
        handshake.unshift(hand_shake * mult) if mult > 0
      else
        handshake << (hand_shake * mult) if mult > 0
      end
      @decimal = remainder
    end
    handshake
  end
  
end

handshake = SecretHandshake.new 9
p handshake.commands #