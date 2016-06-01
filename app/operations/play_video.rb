require 'uri'
require 'cgi'

class PlayVideo
  include Glo::Op

  # Expects:
  # team
  # user
  # dj
  # playlist
  # command string
  #
  def call
    if url.valid? and video.present?
      context.playlist.add_video!(
        title: video.title,
        url: url.to_s,
        user: context.user
      )
      context.dj.new_video_added!
      context.message = "Success! Your video was added to the playlist."
    else
      context.fail!
      context.errors = "That doesn't look like a valid youtube url. "
    end

  rescue StandardError => e
    context.fail!
    context.errors = e.message
  end

  def self.match?(command)
    command =~ /^play/
  end

  private

  def extract_url
    urls = URI.extract(context.command)
    YouTubeUrl.new(urls.first || "")
  end

  def fetch_video
    @video = Yt::Video.new(url:  url.to_s)
  end

  def url
    @url ||= extract_url
  end

  def video
    @video ||= fetch_video
  end
end