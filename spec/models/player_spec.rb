require 'rails_helper'

RSpec.describe Player, :type => :model do

  describe "#play!" do
    it "raises an error if already playing" do
      video = build_stubbed(:video)
      player = build(:player, status: 'playing')
      expect{ player.play!(video) }.to raise_error{ Player::PlayerAlreadyPlayingError }
    end

    it "plays given video and marks it as played" do
      video = create(:video)
      player = create(:player)
      allow(Cable).to receive(:broadcast)

      player.play!(video)

      expect(video.played_at).to be_present
      expect(player.video).to eq video
      expect(player.video).to be_played
      expect(player).to be_playing
      expect(Cable).to have_received(:broadcast).with("player_channel", nextVideoId: video.youtube_id)
    end
  end

  describe "#stop!" do
    it "raises an error if already stopped" do
      player = build(:player, status: 'stopped')
      expect{ player.stop! }.to raise_error{ Player::PlayerAlreadyStoppedError }
    end

    it "stops" do
      player = create(:player, status: 'playing')

      player.stop!
      expect(player).to be_stopped
    end
  end

  describe "#switch!" do
    it "raises an error if stopped" do
      video = build_stubbed(:video)
      player = build(:player, status: 'stopped')
      expect{ player.switch!(video) }.to raise_error{ Player::PlayerAlreadyStoppedError }
    end

    it "switches current video with given one" do
      old_video = create(:video)
      video = create(:video)
      player = create(:player, status: 'playing', video: old_video)

      player.switch!(video)
      video.reload

      expect(player).to be_playing
      expect(player.video).to eq video
      expect(video).to be_played
    end
  end
end
