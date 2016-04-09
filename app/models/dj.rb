class DJ
  class PlaylistAlreadyEndedError < StandardError; end

  attr_reader :player, :playlist

  def initialize(player, playlist)
    @player = player
    @playlist = playlist
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
      player.play!(playlist.next_video)
    else
      raise PlaylistAlreadyEndedError, "Playlist #{playlist.id} already ended"
    end
  end

  def stop!
    player.stop!
  end

  def switch!
    if playlist.any_unplayed?
      player.switch!(playlist.next_video)
    else
      stop!
    end
  end
end
