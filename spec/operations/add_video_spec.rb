require 'rails_helper'

RSpec.describe AddVideo, :type => :operation do
  it "adds video to playlist" do
    url = "http://youtube.com/?v=123456blah"
    team = double(:team)
    user = double(:user)
    playlist = double(:playlist)
    allow(playlist).to receive(:add_video!).with(user: user, url: url)
    dj = double(:dj)
    allow(dj).to receive(:new_video_added!)

    result = AddVideo.call(
      team: team,
      user: user,
      playlist: playlist,
      url: url,
      dj: dj
    )

    expect(result).to be_success

    expect(playlist).to have_received(:add_video!)
    expect(dj).to have_received(:new_video_added!)
  end
end
