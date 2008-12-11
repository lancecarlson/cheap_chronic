class Numeric
  
  def minutes
    self * 60
  end
  
  alias :minute :minutes
  
  def hours
    self.minutes * 60
  end
  
  alias :hour :hours
  
  def days
    self.hours * 24
  end
  
  alias :day :days
  
  def weeks
    self.days * 7
  end
  
  alias :week :weeks
    
end