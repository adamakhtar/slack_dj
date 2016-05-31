require 'uri'
require 'cgi'

class SkipVideo
  include Glo::Op

  # Expects:
  # team
  # user
  # dj
  # playlist
  # command string
  #
  def call
    if context.dj.player.stopped?
      context.fail!
      context.errors = "Sorry but no videos are playing now."
    else
      context.dj.switch!
      context.message = "That video was skipped!"
    end

  rescue StandardError => e
    context.fail!
    context.errors = e.message
  end

  def self.match?(command)
    command =~ /^skip/
  end
end