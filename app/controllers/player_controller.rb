class PlayerController < ApplicationController
  def show
    player = Player.first_or_create
    playlist = Playlist.first_or_create
    team = Team.first_or_create
    @dj = DJ.new(player, playlist, team.user_rota)
    @dj.start! if @dj.waiting?
  end
end
