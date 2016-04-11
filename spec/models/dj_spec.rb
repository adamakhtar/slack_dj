require 'rails_helper'

RSpec.describe DJ, :type => :model do
  describe "#start!" do
    it "raises error if playlist has no playable videos" do
      user_rota = double(:user_rota)
      player = build_stubbed(:player)
      playlist = double(:playlist, any_unplayed?: false)
      dj = DJ.new(player, playlist, user_rota)

      expect{ dj.start! }.to raise_error{ DJ::PlaylistAlreadyEndedError }
    end

    it "gives the player the next video in the playlist" do
      video = double(:video)
      video_selector = double(:video_selector, start: video)
      allow(VideoSelector).to receive(:new).and_return video_selector
      user_rota = double(:user_rota)
      player = build_stubbed(:player)
      playlist = double(:playlist, any_unplayed?: true, next_video: video)
      dj = DJ.new(player, playlist, user_rota)
      allow(player).to receive(:play!).and_return true

      dj.start!

      expect(player).to have_received(:play!).with(video)
    end
  end

  describe "#stop!" do
    it "stops the player" do
      user_rota = double(:user_rota)
      player = build_stubbed(:player)
      playlist = double(:playlist, any_unplayed?: false)
      allow(player).to receive(:stop!)
      dj = DJ.new(player, playlist, user_rota)

      dj.stop!

      expect(player).to have_received(:stop!)
    end
  end


  describe "#switch!" do
    it "gives the player the next video in the playlist" do
      video = double(:video)
      video_selector = double(:video_selector, next: video)
      allow(VideoSelector).to receive(:new).and_return video_selector
      player = build_stubbed(:player)
      allow(player).to receive(:switch!).and_return true
      user_rota = double(:user_rota)
      playlist = double(:playlist, any_unplayed?: true, next_video: video)
      dj = DJ.new(player, playlist, user_rota)

      dj.switch!

      expect(player).to have_received(:switch!).with(video)
    end
  end
end
