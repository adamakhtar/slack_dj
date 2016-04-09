require 'cgi'

class Video < ApplicationRecord

  belongs_to :playlist

  before_validation :set_youtube_id

  def self.oldest_first
    order("created_at ASC")
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

