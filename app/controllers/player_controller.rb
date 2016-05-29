class PlayerController < ApplicationController

  before_action :load_and_authorize_team, except: :test

  def show
    @dj = DJ.new(player, playlist, team.user_rota)
    @dj.start! if @dj.waiting?
  end

  def test
    redirect_to root_path unless Rails.env.development?
  end

  private

  def load_and_authorize_team
    @_team = Team.where(slack_id: params[:id]).take!

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
