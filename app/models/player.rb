class Player < ApplicationRecord

  class PlayerAlreadyPlayingError < StandardError; end
  class PlayerAlreadyStoppedError < StandardError; end

  STATUSES = ['stopped', 'playing']

  validates :status, inclusion: { in: STATUSES }

  belongs_to :video

  def stopped?
    status == "stopped"
  end

  def set_video(video)
    update_attributes(video_id: video.id) and video.played!
  end

  def playing?
    status == "playing"
  end

  def play!(video)
    Player.transaction do
      if stopped? and set_video(video) and update_attribute(:status, "playing")
        Cable.broadcast 'player_channel', nextVideoId: video.youtube_id
        true
      else
        raise PlayerAlreadyPlayingError, "Player #{self.id} is already playing video id:#{video_id}."
      end
    end
  end

  def stop!
    Player.transaction do
      if playing? and update_attribute(:status, "stopped")
        true
      else
        raise PlayerAlreadyStoppedError, "Player #{self.id} is already stopped."
      end
    end
  end

  def switch!(video)
    true if stop! and play!(video)
  end
end