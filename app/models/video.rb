require 'cgi'

class Video < ApplicationRecord

  before_validation :set_youtube_id

  def next
    self.class.where("id  > ? ", self.id).take
  end

  # Returns the next video which has yet to be played
  def self.next_up
    Video.unplayed.take
  end

  def self.unplayed
    where(played_at: nil)
  end

  def played!
    self.update_attribute(:played_at, Time.current)
  end

  private

  def set_youtube_id
    return unless url.present?
    self.youtube_id = CGI.parse(URI.parse(url).query)["v"].first
  end

end

