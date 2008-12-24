require File.join(File.dirname(__FILE__), "..", "spec_helper")

# describe CheapChronic::Rule do  
#   describe "yesterday/today/tomorrow" do
#     it "should calculate yesterday" do
#       CheapChronic.rules[0].match("in 10 weeks").to_s.should == (Time.now + 10.weeks).to_s
#     end
#     
#     it "should calculate today" do
#       CheapChronic.rules[0].match("in 5 days").to_s.should == (Time.now + 5.days).to_s
#     end
#     
#     it "should calculate tomorrow" do
#       CheapChronic.rules[0].match("in 5 days").to_s.should == (Time.now + 5.days).to_s
#     end
#   end
#   
#   describe "in (number) (unit)" do
#     it "should calculate in 10 weeks" do
#       CheapChronic.rules[1].match("in 10 weeks").to_s.should == (Time.now + 10.weeks).to_s
#     end
#     
#     it "should calculate in 5 days" do
#       CheapChronic.rules[1].match("in 5 days").to_s.should == (Time.now + 5.days).to_s
#     end
#   end
# end