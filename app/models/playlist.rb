class Playlist < ApplicationRecord

  has_many :videos
  belongs_to :team, optional: true

  def next_video
    videos.unplayed.oldest_first.limit(1).take
  end

  def add_video!(url:)
    videos.create!(url: url)
  end

  def any_unplayed?
    videos.unplayed.any?
  end

  def all_played?
    videos.unplayed.none?
  end
end