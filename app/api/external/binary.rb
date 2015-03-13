class Binary
  def initialize
    @url = 'url'
  end

  def call_endpoint(message)
    @message = message
    self
  end

  def parsed_response
    @message.unpack('B*')
  end
end
