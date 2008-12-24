module CheapChronic
  module Next
    def time_for_day(day, time=Time.now)
      day_index = ParseDate.parsedate(day).last
      find_next_day(day_index, 1.day, time)
    end
    
    def time_for_month(month, time=Time.now)
      month_index = ParseDate.parsedate(month)[1]
      find_next_month(time, month_index)
    end
    
    def time_for_next_unit(unit, time=Time.now)
      time + 1.send(unit.to_s)
    end
    
    private
    
    def find_next_day(day_index, interval, time=Time.now)
      next_day = time + interval

      unless next_day.wday == day_index
        find_next_day(day_index, interval, next_day) 
      else
        next_day
      end
    end
    
    def find_next_month(time, seek_month)
      result = next_month(time)
      puts "#{result.month} - #{seek_month}"
      puts result
      puts "blah"
      unless result.month == seek_month
        puts "recurse!"
        find_next_month(result, seek_month)
      end
      puts "blah2"
      puts result
      result
    end
    
    def next_month(time)
      Time.mktime(time.year, next_month_index(time.month), time.day, time.hour, time.min, time.sec)
    end
    
    def next_month_index(index)
      index == 12 ? 1 : index + 1
    end
  end
end