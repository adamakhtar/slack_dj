class ShowHelp
  include Glo::Op
  include Rails.application.routes.url_helpers

  # Expects:
  # team
  # user
  # dj
  # playlist
  # command string
  #
  def call
    context.message = help_message

  rescue StandardError => e
    context.fail!
    context.errors = e.message
  end

  def self.match?(command)
    command =~ /^help/
  end

  def help_message
<<-DOC
Watch your teams videos here...
#{team_url}

Play a video via its youtube url
/dj play http://youtube.com....

Find a video by artist and name and play it
/dj find michael jackson thriller

Skip the currently playing video
/dj skip
DOC
  end

  def team_url
    player_url(id: context.team.slack_id, host: ENV.fetch('APP_DOMAIN'))
  end
end