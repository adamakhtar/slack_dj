class AddVideo
  include Glo::Op

  def call
    video = Video.new(url: context.youtube_url)
    if video.save and context.playlist.add(video)
      trigger "playlist:video:added"
    else
      context.fail!
      context.errors = video.errors.full_messages
    end

    context.video = video
  end
end