require 'rails_helper'

RSpec.describe PlayVideo, :type => :operation do
  it "matches with correct commmand" do
    result = PlayVideo.match?("play http://example.com")
    expect(result).to be_truthy
  end

  it "adds video to playlist" do
    command = "play https://www.youtube.com/watch?v=mmi60Bd4jSs"
    team = double(:team)
    user = double(:user)
    video = double(:video, title: 'Michael Jackson Thriller')
    playlist = double(:playlist)
    allow(playlist).to receive(:add_video!).with(
      user: user,
      url: "https://www.youtube.com/watch?v=mmi60Bd4jSs",
      title: video.title
    )
    dj = double(:dj)
    allow(Yt::Video).to receive(:new).and_return video

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
