module CheapChronic
  @rules = []

  class << self
    attr_reader :rules
  end
  
  class Rule
    include CheapChronic::Next
    
    def self.search(text)
      CheapChronic.rules.each do |rule|
        time = rule.match(text)
        if time
          @found = true
          return time
        end
      end
      return nil unless @found
    end
        
    def initialize(regexp, &block)
      @regexp = regexp
      @block = block
      
      CheapChronic.rules << self
    end
    
    def match(text)
      @matches = convert_strings_to_types(text.scan(@regexp).flatten)
      
      @matches.empty? ? nil : self.instance_eval(&@block)
    end
    
    def now
      Time.now
    end
    
    def day?(text)
      CheapChronic::DAYS.include?(text)
    end
    
    def month?(text)
      CheapChronic::MONTHS.include?(text)
    end
    
    def unit?(text)
      CheapChronic::UNITS.include?(text)
    end
    
    attr_reader :matches
    
    private
    
    def convert_strings_to_types(array)
      array.map do |match|
        case match
        when /^\d+$/ : Integer(match)
        when /^[\d.]+$/ : Float(match)
        else match
        end
      end
    end
  end
end