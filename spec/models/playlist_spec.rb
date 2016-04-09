require 'rails_helper'

RSpec.describe Playlist, :type => :model do
  it "#next_video returns oldest video added" do
    playlist = Playlist.create
    a = create(:video, playlist: playlist, created_at: 1.day.ago)
    b = create(:video, playlist: playlist, created_at: 2.days.ago)

    expect(playlist.next_video).to eq b
  end
end
