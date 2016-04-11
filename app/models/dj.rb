class DJ
  class PlaylistAlreadyEndedError < StandardError; end

  attr_reader :player, :playlist, :user_rota

  def initialize(player, playlist, user_rota)
    @player = player
    @playlist = playlist
    @user_rota = user_rota
  end

  # TODO - use whisper and listen for an event
  def new_video_added!
    start! if waiting?
  end

  def waiting?
    player.stopped? and playlist.any_unplayed?
  end

  def finished?
    player.stopped? and playlist.all_played?
  end

  def playing?
    player.playing?
  end

  def current_video
    player.video
  end

  def start!
    if playlist.any_unplayed?
      player.play!(video_selector.start)
    else
      raise PlaylistAlreadyEndedError, "Playlist #{playlist.id} already ended"
    end
  end

  def stop!
    player.stop!
  end

  def switch!
    if playlist.any_unplayed?
      player.switch!(video_selector.next)
    else
      stop!
    end
  end

  private

  def video_selector
    @video_selector ||= VideoSelector.new(playlist, user_rota)
  end
end

