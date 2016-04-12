require 'uri'
require 'cgi'

class AddVideo
  include Glo::Op

  # Expects:
  # team
  # user
  # dj
  # playlist
  # url string
  #
  def call
    context.playlist.add_video!(video_params)
    context.dj.new_video_added!

  rescue StandardError => e
    context.fail!
    context.errors = e.message
  end

  private

  def video_params
    {
      url: context.url,
      user: context.user
    }
  end
end