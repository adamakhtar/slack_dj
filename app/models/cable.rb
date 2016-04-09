class Cable
  def self.broadcast(channel, payload={})
    ActionCable.server.broadcast channel, payload
  end
end