require 'parsedate'

%w(context core_ext token_template weekdays).each do |file|
  require File.join(File.dirname(__FILE__), "cheap_chronic", file)
end

module CChronic
  def self.parse(text)
    tokens = tokenize(text)
    parse_tokens(tokens)
  end
  
  def self.parse_tokens(tokens, last_token=nil)
    token = tokens.shift
    
    @result = case token
    when "this" : parse_tokens(tokens)
    when "next" : parse_tokens(tokens)
    when "coming" : parse_tokens(tokens)
    when "week" : find_token(token)
    when "in" : find_token(tokens[1], tokens[0])
    else find_token(token)
    end
    
    @result
  end
  
  def self.find_token(token, *args)
    Tokens.send(token, *args)
  end
  
  def self.tokenize(text)
    @tokens = text.downcase.split(" ")
  end
end

def CheapChronic(text)
  CChronic.parse(text)
end