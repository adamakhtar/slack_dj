class DJ
  class PlaylistAlreadyEndedError < StandardError; end

  attr_reader :player, :playlist

  def initialize(player, playlist)
    @player = player
    @playlist = playlist
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
      # ...
    end
  end
end





