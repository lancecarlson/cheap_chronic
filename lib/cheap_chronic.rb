require 'parsedate'

module CheapChronic
  FULL_DAYS = %w(sunday monday tuesday wednesday thursday friday saturday)
  SHORT_DAYS = %w(sun mon tue wed thu fri fat)
  SHORTEST_DAYS = %w(su m tu w th f sa)
  ODDBALL_DAYS = %w(tu tues thur thurs)
  DAYS = FULL_DAYS + SHORT_DAYS + SHORTEST_DAYS
  FULL_MONTHS = %w(january february march april may june july august september october november december)
  SHORT_MONTHS = %w(jan feb mar apr may jun jul aug sep oct nov dec)
  MONTHS = FULL_MONTHS + SHORT_MONTHS
  SINGULAR_UNITS = %w(second minute hour day week month year)
  PLURAL_UNITS = SINGULAR_UNITS.map{|unit| unit + "s"}
  SHORT_SINGULAR_UNITS = %w(sec min hr wk mnth yr)
  SHORT_PLURAL_UNITS = SHORT_SINGULAR_UNITS.map{|unit| unit + "s"}
  UNITS = SINGULAR_UNITS + PLURAL_UNITS
  
  def self.parse(text, options = {})
    @options = options
    @options[:now] ||= Time.now
    
    find_rule(text.downcase)
  end
  
  def self.find_rule(text)
    CheapChronic::Rule.search(text)
  end
end

%w(core_ext next rule rules).each do |file|
  require File.join(File.dirname(__FILE__), "cheap_chronic", file)
end