# require File.join(File.dirname(__FILE__), "..", "spec_helper")
# 
# describe CheapChronic::Weekdays do
#   before do
#     @now = Time.now
#   end
#   
#   it "should return the time for each day" do
#     i = 0
#     %w(sunday monday tuesday wednesday thursday friday saturday).each do |day|
#       time = CheapChronic::Weekdays.time_for_day(day)
#       time.wday.should == i
#       %w(year month hour min sec).each do |a|
#         time.send(a).should == @now.send(a)
#       end
#       i += 1
#     end
#   end
#   
#   it "should return the time for each short day" do
#     i = 0
#     %w(sun mon tue wed thu fri sat).each do |day|
#       time = CheapChronic::Weekdays.time_for_day(day)
#       time.wday.should == i
#       %w(year month hour min sec).each do |a|
#         time.send(a).should == @now.send(a)
#       end
#       i += 1
#     end
#   end
# end