module CChronic
  module Context
    def self.yesterday
      Time.now - 1.day
    end
    
    def self.today
      Time.now
    end
    
    def self.tomorrow
      Time.now + 1.day
    end
    
    def self.week
      Time.now + 7.days 
    end
    
    def self.weeks(number)
      Time.now + number.to_i.weeks
    end
  end
end