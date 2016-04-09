require 'rails_helper'

RSpec.describe Video, :type => :model do
  it "extracts youtube video id from url before validation" do
    video = Video.new(url: "https://www.youtube.com/watch?v=SIQihN--98Y")
    video.valid?
    expect(video.youtube_id).to eq "SIQihN--98Y"
  end
end
