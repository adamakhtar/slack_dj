# Takes the query in given command and searches
# youtube. Takes the first video returned
# by youtube api and adds it to the playlist
#

class FindVideo
  include Interactor

  # Expects:
  # team
  # user
  # dj
  # playlist
  # command e.g. "find Michael Jackson Thriller"
  #
  def call
    video = search_youtube
    if video.present?
      context.playlist.add_video!(
        title: video.title,
        url: "https://www.youtube.com/watch?v=#{video.id}",
        user: context.user
      )
      context.dj.new_video_added!
      context.message = "Success! #{video.title} was added to the playlist."
    else
      context.errors = "Sorry but couldn't find any vides for #{query}."
      context.fail!
    end
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
    query = context.command.gsub(/^find/, "").strip
  end
end