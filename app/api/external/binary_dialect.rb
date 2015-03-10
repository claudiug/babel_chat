class BinaryDialect
  def initialize(message)
    @message = message
  end

  def translate
    @message.unpack("B*")
  end

  private
end