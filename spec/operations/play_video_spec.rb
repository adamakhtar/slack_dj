require 'rails_helper'

RSpec.describe PlayVideo, :type => :operation do
  it "adds video to playlist" do
    command = "play https://www.youtube.com/watch?v=mmi60Bd4jSs"
    team = double(:team)
    user = double(:user)
    playlist = double(:playlist)
    allow(playlist).to receive(:add_video!).with(user: user, url: "https://www.youtube.com/watch?v=mmi60Bd4jSs")
    dj = double(:dj)
    allow(dj).to receive(:new_video_added!)

    result = PlayVideo.call(
      team: team,
      user: user,
      playlist: playlist,
      command: command,
      dj: dj
    )

    expect(result).to be_success

    expect(playlist).to have_received(:add_video!)
    expect(dj).to have_received(:new_video_added!)
  end
end
