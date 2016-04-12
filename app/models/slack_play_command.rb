require 'uri'

class SlackPlayCommand
  def initialize(text)
    @text = text
  end

  attr_reader :text

  def url
    @url ||= begin
      urls = URI.extract(text)
      YouTubeUrl.new(urls.first) if urls.any?
    end
  end

  def params
    {video_id: url.video_id, url: url.to_s}
  end

  def valid?
    url.present? and url.valid?
  end
end