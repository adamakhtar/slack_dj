class AddVideo
  include Glo::Op

  def call
    video = Video.new(url: context.youtube_url)
    if video.save and context.playlist.add(video)
      context.video = video
    else
      context.fail!
      context.errors = video.errors.full_messages
    end
  end
end