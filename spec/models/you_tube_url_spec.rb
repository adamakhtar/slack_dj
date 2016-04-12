require 'rails_helper'

RSpec.describe YouTubeUrl, :type => :model do
  it "returns true when valid" do
    url = YouTubeUrl.new("https://www.youtube.com/watch?v=SIQihN--98Y")
    expect(url).to be_valid
  end

  it "returns flase when not valid" do
    url = YouTubeUrl.new("https://www.youtube.com/watch?v=SI")
    expect(url).to_not be_valid
  end

  it "extracts youtube video id from url" do
    url = YouTubeUrl.new("https://www.youtube.com/watch?v=SIQihN--98Y")
    expect(url.video_id).to eq "SIQihN--98Y"
  end
end
