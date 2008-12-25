# <yesterday/today/tomorrow>
CheapChronic::Rule.new /(yesterday|today|tomorrow)/ do
  unit = matches[0]
  
  seconds = case unit
  when "yesterday" : -1.day
  when "today" : 0
  when "tomorrow" : 1.day
  end
  
  now + seconds if seconds
end

# <monday-sunday>
# <mon-sun>
CheapChronic::Rule.new /^(#{CheapChronic::DAYS.join("|")})$/ do
  day = matches[0]
  
  time_for_next_weekday(day, now)
end

# <january-december>
# <jan-dec>
CheapChronic::Rule.new /^(#{CheapChronic::MONTHS.join("|")})$/ do
  month = matches[0]
  
  time_for_next_month(month, now)
end

# in <quantity> <seconds/minutes/hours/days/weeks/months/years>
CheapChronic::Rule.new /in (\d+) (#{CheapChronic::UNITS.join("|")})/ do
  quantity = matches[0]
  unit = matches[1]
  
  now + (quantity.send(unit))
end

# next <monday-sunday>
# next <january-december>
# next <second/minute/hour/day/week/month/year>
# this <monday-sunday>
# this <january-december>
# this <second/minute/hour/day/week/month/year>
CheapChronic::Rule.new /(next|this) (\w+)/ do
  day_or_month_unit = matches[1]
  
  if day?(day_or_month_unit)
    time_for_next_weekday(day_or_month_unit, now)
  elsif month?(day_or_month_unit)
    time_for_next_month(day_or_month_unit, now)
  elsif unit?(day_or_month_unit)
    time_for_next_unit(day_or_month_unit, now)
  else
    nil
  end
end

# ParseDate
CheapChronic::Rule.new /(.)/ do
  all = matches[0]
  
  results_array = ParseDate.parsedate(all)
  if results_array == [nil, nil, nil, nil, nil, nil, nil, nil]
    nil
  else
    begin
      Time.mktime(results_array[0], results_array[1], results_array[2], results_array[3], results_array[4], results_array[5], results_array[6])
    rescue TypeError
      nil
    end
  end
end