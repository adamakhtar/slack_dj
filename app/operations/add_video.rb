require 'uri'
require 'cgi'

class AddVideo
  include Glo::Op

  COMMAND = /^play/

  # Expects:
  # team
  # user
  # dj
  # playlist
  # command string
  #
  def call
    url = extract_url

    if url.valid?
      context.playlist.add_video!(
        url: url.to_s,
        user: context.user
      )
      context.dj.new_video_added!
      context.message = "Success! Your video was added to the playlist."
    else
      context.fail!
      context.errors = "That is not a valid youtube url."
    end

  rescue StandardError => e
    context.fail!
    context.errors = e.message
  end

  private

  def extract_url
    urls = URI.extract(context.command)
    YouTubeUrl.new(urls.first || "")
  end
end