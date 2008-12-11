require File.join(File.dirname(__FILE__), "spec_helper")

describe "CheapChronic" do
  before do
    @now = Time.now
    @full_days = %w(Sunday Monday Tuesday Wednesday Thursday Friday Saturday)
    @short_days = %w(Sun Mon Tue Wed Thu Fri Sat)
  end
  
  it "should give today's date with the current time when supplied with 'today'" do
    CheapChronic("today").to_i.should == @now.to_i
  end
  
  it "should give tomorrow's date with the current time when supplied with 'tomorrow'" do
    CheapChronic("tomorrow").to_i.should == @now.to_i + 1.day
  end
  
  it "should give yesterday's date with the current time when supplied with 'yesterday'" do
    CheapChronic("yesterday").to_i.should == @now.to_i - 1.day
  end
  
  it "should give the date with the current time when the upcoming day is specified (Monday-Sunday)" do
    i = 0
    @full_days.each do |day|
      time = CheapChronic(day)
      time.wday.should == i
      i += 1
    end
  end
  
  it "should give the date with the current time when the upcoming day is specified shorthand (Mon-Sun)" do
    i = 0
    @short_days.each do |day|
      time = CheapChronic(day)
      time.wday.should == i
      i += 1
    end
  end
  
  it "should handle messed up day acronymns" do
    day_indices = [0, 1, 2, 2, 2, 3, 3, 4, 4, 4, 5, 6]
    
    %w(su m tu tue tues w wed th thur thurs f sa).each do |day|
      time = CheapChronic(day)
      time.wday.should == day_indices.shift
    end
  end
  
  it "should parse 'this <day>'" do
    i = 0
    @full_days.each do |day|
      time = CheapChronic("this #{day}")
      time.wday.should == i
      i += 1
    end
  end
  
  it "should parse 'this coming <day>'" do
    i = 0
    @full_days.each do |day|
      time = CheapChronic("this coming #{day}")
      time.wday.should == i
      i += 1
    end
  end
  
  it "should parse 'next week'" do
    CheapChronic("next week").to_i.should == Time.now.to_i + 7.days
  end
  
  describe "in <interval> <units>" do
    it "should parse 'in 1 hour'" do
      CheapChronic("in 1 hour").to_i.should == Time.now.to_i + 1.hour
    end
  
    it "should parse 'in <num> hours'" do
      10.times do |number|
        CheapChronic("in #{number} hours").to_i.should == Time.now.to_i + number.hours
      end
    end
  
    it "should parse 'in 1 day'" do
      CheapChronic("in 1 day").to_i.should == Time.now.to_i + 1.day
    end
  
    it "should parse 'in <num> days'" do
      10.times do |number|
        CheapChronic("in #{number} days").to_i.should == Time.now.to_i + number.days
      end
    end
  
    it "should parse 'in 1 week'" do
      CheapChronic("in 1 week").to_i.should == Time.now.to_i + 1.week
    end
  
    it "should parse 'in <num> weeks'" do
      10.times do |number|
        CheapChronic("in #{number} weeks").to_i.should == Time.now.to_i + number.weeks
      end
    end
  end
end