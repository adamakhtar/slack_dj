require 'rails_helper'

RSpec.describe ShowHelp, :type => :operation do
  it "mathces with correct commmand" do
    result = ShowHelp.match?("help")
    expect(result).to be_truthy
  end
end
