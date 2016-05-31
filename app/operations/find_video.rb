class FindVideo
  include Glo::Op

  # Expects:
  # team
  # user
  # dj
  # playlist
  # command string
  #
  def call
    video  = search_youtube

    if video.present?
      Rails.logger.error {video.to_yaml}
      Rails.logger.error {query}
      context.playlist.add_video!(
        url: "https://www.youtube.com/watch?v=#{video.id}",
        user: context.user
      )
      context.dj.new_video_added!
      context.message = "Success! #{video.title} was added to the playlist."
    else
      context.fail!
      context.errors = "Sorry but couldn't find any vides for #{command.query}."
    end

  rescue StandardError => e
    context.fail!
    context.errors = e.message
  end

  def self.match?(command)
    command =~ /^find/
  end

  private


  def search_youtube
     search = Yt::Collections::Videos.new
     videos = search.where(q: query, order: "viewCount")
     videos.first
  end

  def query
    query = context.command.gsub("/^find", "").strip
  end
end