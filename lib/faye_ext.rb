class UsersEvent

  CHANNELS = %w(/meta/subscribe /meta/disconnect)

  def incoming(message, callback)
    p "IN #{message}"
    return callback.call(message) unless CHANNELS.include? message['channel']
    callback.call(message)
  end

  def outgoing(message, callback)
    p "OUT #{message}"
    callback.call(message)
  end

  def faye_client
    @faye_client ||= Faye::Client.new('http://localhost:9292/faye')
  end
end