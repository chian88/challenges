require 'pry'
class Translation
    
    PROTEIN = { %w(AUG) => "Methionine" , %w(UUU UUC) => "Phenylalanine",
                %w(UUA UUG) => "Leucine", %w(UCU UCC UCA UCG) => "Serine" , 
                %w(UAU UAC) => "Tyrosine", %w(UGU UGC) => "Cysteine", 
                %w(UGG) => "Tryptophan", %w(UAA UAG UGA) => "STOP" }
    
    def self.of_codon(codon)
      protein = ''
      PROTEIN.each { |key, value| protein = value if key.include? codon }
      raise InvalidCodonError if protein == ""
      protein
    end
    
    def self.of_rna(strand)
      strand_array = strand.scan(/\w{3}/)
      raw_protein = strand_array.map { |rna| self.of_codon(rna) }
      raw_protein.take_while { |codon| codon != "STOP" }
    end
end

class InvalidCodonError < StandardError ; end
  
  
  
  
