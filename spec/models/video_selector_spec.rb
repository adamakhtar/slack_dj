require 'rails_helper'

RSpec.describe UserRota, :type => :model do
  describe "#next" do
    it "sets the next turn and return's their video" do
      team = create(:team)
      user_a = create(:user, team: team)
      user_b = create(:user, team: team)

      playlist = create(:playlist)
      video_first = create(:video, playlist: playlist, user: user_a)
      video_last = create(:video, playlist: playlist, user: user_b)

      video_selector = VideoSelector.new(playlist, team.user_rota)

      next_video = video_selector.next

      expect(next_video).to eq video_last
    end
  end
end
