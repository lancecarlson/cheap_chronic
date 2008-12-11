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
    
    def self.hour
      Time.now + 1.hour
    end
    
    def self.hours(number=0)
      Time.now + number.to_i.hours
    end
    
    def self.day
      Time.now + 1.day
    end
    
    def self.days(number=0)
      Time.now + number.to_i.days
    end
    
    def self.week
      Time.now + 7.days 
    end
    
    def self.weeks(number=0)
      Time.now + number.to_i.weeks
    end
  end
end