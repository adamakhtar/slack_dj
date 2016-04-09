# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class PlayerChannel < ApplicationCable::Channel
  def subscribed
    stream_from "player_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def start
  end

  def next
    player = Player.first_or_create
    playlist = Playlist.first_or_create
    dj = DJ.new(player, playlist)
    dj.switch!
  rescue StandardError => e
    puts e.message
  end

  private

  def with_authorized_video(video_id)
    video = Video.find_by_youtube_id(video_id)

    if video.present?
      yield video
    else
      ActionCable.server.broadcast 'player_channel', playlistEnded: true
    end
  end

  def load_playlist

  end

  def load_player

  end
end
