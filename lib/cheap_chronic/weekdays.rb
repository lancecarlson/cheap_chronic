module CChronic
  module Weekdays    
    class << self 
      def time_for_day(day)
        day_index = ParseDate.parsedate(day).last
        find_next(day_index, 1.day)
      end
      
      def find_next(day_index, interval, time=Time.now)
        next_day = time + interval
        
        unless next_day.wday == day_index
          find_next(day_index, interval, next_day) 
        else
          next_day
        end
      end
    end
  end
end