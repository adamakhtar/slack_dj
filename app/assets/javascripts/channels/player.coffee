App.player = App.cable.subscriptions.create "PlayerChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    console.log("received", data)
    if data.nextVideoId
      window.player.play(data.nextVideoId);
    else if data.playlistEnded
      $('.playlist-ended-alert').show()

  start: ->
    @perform 'start'

  next: (videoId)->
    @perform 'next', currentVideoId: videoId
