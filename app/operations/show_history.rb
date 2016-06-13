# Returns a string formatted table
# of the last videos played for
# all users.
#
class ShowHistory
  include Interactor

  class VideoPresenter < SimpleDelegator
    def self.wrap(videos)
      videos.map{ |v| new(v) }
    end

    def self.print(videos)
      wrap(videos).map(&:print).join("\n")
    end

    def print
      user_name = user.name.present? ? user.name : "John Doe"
      video_title = title ? title : "Title unknown"

      "#{user_name} - #{video_title}"
    end
  end

  # Expects:
  # team
  # user
  # dj
  # playlist
  # command string
  #
  def call
    context.message = played_videos_report
  end

  def self.match?(command)
    command =~ /^history/
  end

  private

  def played_videos_report
    if played_videos.any?
      report = "Last Played Videos\n"
      report << VideoPresenter.print(played_videos)
    else
      report = "No played videos"
    end
    report
  end

  def played_videos
    context.playlist.last_played(20)
  end
end