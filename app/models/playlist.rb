class Playlist < ApplicationRecord

  has_many :videos

  def next_video
    videos.unplayed.oldest_first.limit(1).take
  end

  def any_unplayed?
    videos.unplayed.any?
  end

  def all_played?
    videos.unplayed.none?
  end
end