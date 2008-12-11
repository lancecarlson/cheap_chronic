module CChronic
  module Tokens
    class << self      
      # Context
      %w(yesterday today tomorrow hour day week).each do |context|
        define_method(context) { Context.send(context) }
      end

      # Full days
      %w(sunday monday tuesday wednesday thursday friday saturday).each do |day|
        define_method(day) { Weekdays.time_for_day(day) }
      end
      
      def hours(*args)
        Context.hours(*args)
      end
      
      def days(*args)
        Context.days(*args)
      end
      
      def weeks(*args)
        Context.weeks(*args)
      end

      # Shorthand days
      alias :sun    :sunday
      alias :su     :sunday
      alias :mon    :monday
      alias :m      :monday
      alias :tues   :tuesday
      alias :tue    :tuesday
      alias :tu     :tuesday
      alias :wed    :wednesday
      alias :w      :wednesday
      alias :thurs  :thursday
      alias :thur   :thursday
      alias :thu    :thursday
      alias :th    :thursday
      alias :fri    :friday
      alias :f      :friday
      alias :sat    :saturday
      alias :sa     :saturday
    end
  end
end