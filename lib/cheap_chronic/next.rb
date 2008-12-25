module CheapChronic
  module Next
    #
    # examples when the today's date is 2008-12-25 (Yes, I was hacking on X-mas):
    #
    
    #   >> time_for_next_weekday("thursday")
    #   => #<DateTime: 212096943323/86400,0,2299161>
    #   >> time_for_next_weekday("thursday").to_s
    #   => "2008-12-25T05:35:26+00:00"
    #   >> time_for_next_weekday("friday").to_s
    #   => "2008-12-26T05:35:32+00:00"
    #   >> time_for_next_weekday("monday").to_s
    #   => "2008-12-29T05:35:39+00:00"
    def time_for_next_weekday(day, time=Time.now)
      day = day_index(day) unless day.is_a?(Integer)
      datetime(time) + days_until_next_weekday(day)
    end
    
    #   time_for_next_month("january").to_s
    #   => "2009-01-25T05:00:05+00:00"
    #   time_for_next_month("december").to_s
    #   => "2008-12-25T05:00:18+00:00"
    #   time_for_next_month("november").to_s
    #   => "2009-11-25T05:00:27+00:00"  
    def time_for_next_month(month, time=Time.now)
      month = month_index(month) unless month.is_a?(Integer)
      month = 0 if month == time.month
      
      datetime(time) >> month
    end
    
    def time_for_next_unit(unit, time=Time.now)
      case unit
      when "month", "months" : datetime(time) >> 1
      when "year", "years" : datetime(time) >> 12
      else time + 1.send(unit.to_s)
      end
    end
    
    # Given the day of the week, will return it's wday index
    #   ie: day_index("wednesday") #=> 3
    def day_index(day)
      ParseDate.parsedate(day).last
    end
    
    # Given the day of the week, will return it's wday index
    #   ie: month_index("april") #=> 4
    def month_index(month)
      ParseDate.parsedate(month)[1]
    end
    
    # DateTime conversion of time
    def datetime(time=Time.now)
      DateTime.new(time.year, time.month, time.day, time.hour, time.min, time.sec, (Float(time.utc_offset)/86400))
    end
    
    private
    
    def days_until_next_weekday(day, time=Time.now)
      (0..6).map {|i| 
        i=i-7 if (time.wday+i) >= 7
        time.wday+i
      }.index(day)
    end
  end
end