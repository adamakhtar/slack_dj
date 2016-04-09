class PlayerController < ApplicationController
  def show
    player = Player.first_or_create
    playlist = Playlist.first_or_create
    @dj = DJ.new(player, playlist)
    @dj.start! if @dj.waiting?
  end
end
