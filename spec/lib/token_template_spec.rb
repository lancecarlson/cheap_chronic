# require File.join(File.dirname(__FILE__), "..", "spec_helper")
# 
# describe CheapChronic::Tokens do
#   it "should have all of the contexts" do
#     %w(yesterday today tomorrow).each do |context|
#       defined?(CheapChronic::Tokens.send(context)).should == "method"
#     end
#   end
#   
#   it "should have all of the full days of the week" do
#     %w(sunday monday tuesday wednesday thursday friday saturday).each do |day|
#       defined?(CheapChronic::Tokens.send(day)).should == "method"
#     end
#   end
#   
#   it "should have all of the short days of the week" do
#     %w(sun mon tue wed thu fri sat).each do |day|
#       defined?(CheapChronic::Tokens.send(day)).should == "method"
#     end
#   end
# end