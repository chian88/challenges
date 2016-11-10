class Scrabble
  SCORE_CHART =
  { %w(A E I O U L N R S T) => 1,
    %w(D G) => 2,
    %w(B C M P) => 3,
    %w(F H V W Y) => 4,
    %w(K) => 5,
    %w(J X) => 8,
    %w(Q Z) => 10
  }
  
  def initialize(word)
    @word = word
  end
  
  def score
    return 0 if @word.nil?
    score = 0
    @word.each_char do |char|
      SCORE_CHART.each { |key, value| score += value if key.include? char.upcase }
    end
    score
  end
  
  def self.score(word)
    return 0 if word.nil?
    score = 0
    word.each_char do |char|
      SCORE_CHART.each { |key, value| score += value if key.include? char.upcase }
    end
    score
  end
  
end