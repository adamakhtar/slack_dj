require 'uri'
require 'cgi'

class YouTubeUrl
  def initialize(url)
    @url = url
  end

  def to_s
    @url
  end

  def video_id
    @video_id ||= begin
      values = CGI::parse(uri.query)["v"]
      values.first if values.any?
    end
  end

  def uri
    @uri ||= URI.parse(@url)
  end

  def valid?
    (uri.scheme == "http" or "https") and (uri.host =~ /.*?youtube.com/) and video_id.length == 11
  end
end