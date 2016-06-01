require 'cgi'

class Video < ApplicationRecord

  belongs_to :playlist, optional: true
  belongs_to :user, optional: true

  before_validation :set_youtube_id

  validates :user_id, :youtube_id, presence: true

  def self.oldest_first
    order("created_at ASC")
  end

  def self.next_for(user)
    unplayed.where(user_id: user.id).take
  end

  def self.unplayed
    where(played_at: nil)
  end

  def self.played
    where("played_at IS NOT NULL")
  end

  def played!
    self.update_attribute(:played_at, Time.current)
  end

  def played?
    played_at.present?
  end

  private

  def set_youtube_id
    return unless url.present?
    self.youtube_id = CGI.parse(URI.parse(url).query)["v"].first
  end
end

