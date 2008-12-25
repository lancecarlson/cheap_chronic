require File.join(File.dirname(__FILE__), "spec_helper")

describe "CheapChronic" do
  before do
    @now = Time.now
    @full_days = CheapChronic::FULL_DAYS
    @short_days = CheapChronic::SHORT_DAYS
    @full_months = CheapChronic::FULL_MONTHS
    @short_months = CheapChronic::SHORT_MONTHS
  end
  
  it "should give today's date with the current time when supplied with 'today'" do
    CheapChronic.parse("today").to_i.should == @now.to_i
  end
  
  it "should give tomorrow's date with the current time when supplied with 'tomorrow'" do
    CheapChronic.parse("tomorrow").to_i.should == @now.to_i + 1.day
  end
  
  it "should give yesterday's date with the current time when supplied with 'yesterday'" do
    CheapChronic.parse("yesterday").to_i.should == @now.to_i - 1.day
  end
  
  describe "days" do
    it "should give the date with the current time when the upcoming day is specified (Monday-Sunday)" do
      i = 0
      @full_days.each do |day|
        time = CheapChronic.parse(day)
        time.wday.should == i
        i += 1
      end
    end
  
    it "should give the date with the current time when the upcoming day is specified shorthand (Mon-Sun)" do
      i = 0
      @short_days.each do |day|
        time = CheapChronic.parse(day)
        time.wday.should == i
        i += 1
      end
    end
  
    # it "should handle messed up day acronymns" do
    #   day_indices = [0, 1, 2, 2, 2, 3, 3, 4, 4, 4, 5, 6]
    # 
    #   %w(su m tu tue tues w wed th thur thurs f sa).each do |day|
    #     time = CheapChronic.parse(day)
    #     time.wday.should == day_indices.shift
    #   end
    # end
  end
  
  describe "months" do
    it "should give the date with the current time when the upcoming month is specified (January-December)" do
      i = 1
      @full_months.each do |month|
        time = CheapChronic.parse(month)
        time.month.should == i
        i += 1
      end
    end
    
    it "should give the date with the current time when the upcoming month is specified shorthand (Jan-Dec)" do
      i = 1
      @short_months.each do |month|
        time = CheapChronic.parse(month)
        time.month.should == i
        i += 1
      end
    end
  end

  it "should parse 'this <day>'" do
    i = 0
    @full_days.each do |day|
      time = CheapChronic.parse("this #{day}")
      time.wday.should == i
      i += 1
    end
  end
  
  # it "should parse 'this coming <day>'" do
  #   i = 0
  #   @full_days.each do |day|
  #     time = CheapChronic.parse("this coming #{day}")
  #     time.wday.should == i
  #     i += 1
  #   end
  # end
  
  describe "next" do
    it "should parse 'next week'" do
      CheapChronic.parse("next week").to_i.should == Time.now.to_i + 7.days
    end
      
    it "should parse 'next month'" do
      CheapChronic.parse("next month").to_s.should == (DateTime.now >> 1).to_s
    end
    
    it "should parse 'next <day>'" do
      next_wed = CheapChronic.parse("next wednesday")
      next_wed.wday.should == 3
      next_wed.should > DateTime.now
      next_wed.should < DateTime.now + 1.week
    end
  end
  
  describe "in <interval> <units>" do
    it "should parse 'in 1 hour'" do
      CheapChronic.parse("in 1 hour").to_i.should == Time.now.to_i + 1.hour
    end
  
    it "should parse 'in <num> hours'" do
      10.times do |number|
        CheapChronic.parse("in #{number} hours").to_i.should == Time.now.to_i + number.hours
      end
    end
  
    it "should parse 'in 1 day'" do
      CheapChronic.parse("in 1 day").to_i.should == Time.now.to_i + 1.day
    end
  
    it "should parse 'in <num> days'" do
      10.times do |number|
        CheapChronic.parse("in #{number} days").to_i.should == Time.now.to_i + number.days
      end
    end
  
    it "should parse 'in 1 week'" do
      CheapChronic.parse("in 1 week").to_i.should == Time.now.to_i + 1.week
    end
  
    it "should parse 'in <num> weeks'" do
      10.times do |number|
        CheapChronic.parse("in #{number} weeks").yday.should == ((Time.now + number.weeks).yday)
      end
    end
  end
end