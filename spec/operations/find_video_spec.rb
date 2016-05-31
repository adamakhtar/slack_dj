require 'rails_helper'

RSpec.describe FindVideo, :type => :operation do
  it "mathces with correct commmand" do
    result = FindVideo.match?("find michael jackson thriller")
    expect(result).to be_truthy
  end
end
