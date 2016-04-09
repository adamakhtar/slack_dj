class SlackWebhooksController < ApplicationController

  skip_before_action :verify_authenticity_token, only: :create

  def create
    player = Player.first_or_create
    playlist = Playlist.first_or_create
    playlist.add_video!(url: shuffle_urls.first)

    dj = DJ.new(player, playlist)
    dj.new_video_added!

    head :created

    rescue StandardError => e
      Rails.logger.error { "#{e.message} #{e.backtrace.join("\n")}" }
      head :unprocessable_entity
  end

  private

  def shuffle_urls
    %w{
      https://www.youtube.com/watch?v=5KU1EqeUuT4
      https://www.youtube.com/watch?v=V64W0dXhZ2Y
      https://www.youtube.com/watch?v=co3FzW89EpY
      https://www.youtube.com/watch?v=1MPKDRqhZ3c
      https://www.youtube.com/watch?v=9hGIYiWXq2s
      https://www.youtube.com/watch?v=4Tr_tCRynfo
    }.shuffle
  end
end
