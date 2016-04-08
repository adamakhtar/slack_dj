class AddVideo
  include Glo::Op

  def call
    video = Video.new(url: context.youtube_url)
    video.save

    if video.invalid?
      context.fail!
      context.errors = video.errors.full_messages
    end

    context.video = video
  end
end