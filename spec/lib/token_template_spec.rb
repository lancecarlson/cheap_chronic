require File.join(File.dirname(__FILE__), "..", "spec_helper")

describe CChronic::Tokens do
  it "should have all of the contexts" do
    %w(yesterday today tomorrow).each do |context|
      CChronic::Tokens.method_defined?(context).should be_true
    end
  end
  
  it "should have all of the full days of the week" do
    %w(sunday monday tuesday wednesday thursday friday saturday).each do |day|
      CChronic::Tokens.method_defined?(day).should be_true
    end
  end
  
  it "should have all of the short days of the week" do
    %w(sun mon tue wed thu fri sat).each do |day|
      CChronic::Tokens.method_defined?(day).should be_true
    end
  end
end