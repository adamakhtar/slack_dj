class PlayerController < ApplicationController

  before_action :load_team, except: [:test, :welcome]

  def show
    @dj = DJ.new(player, playlist, team.user_rota)
    @dj.start! if @dj.waiting?
  end

  def test
    redirect_to root_path unless Rails.env.development?
  end

  def welcome
  end

  private

  def load_team
    @_team = Team.take!

  rescue ActiveRecord::RecordNotFound => e
    redirect_to '/'
  end

  def team
    @_team
  end

  def player
    @_player = team.player
  end

  def playlist
    @_playlist = team.playlist
  end
end
