class VideoSelector
  def initialize(playlist, user_rota)
    @playlist = playlist
    @user_rota = user_rota
  end

  def next
    user_rota.advance_to_next_turn
    each_turns_next_video.first
  end

  def start
    each_turns_next_video.first
  end

  private

  attr_reader :playlist, :user_rota

  # TODO optimize with window function?
  def each_turns_next_video
    user_rota.all.map{ |user| Video.next_for(user) }.compact
  end
end
