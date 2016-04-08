class PlayerController < ApplicationController
  def show
    if @video = Video.next_up
      @video.played!
    end
  end
end
