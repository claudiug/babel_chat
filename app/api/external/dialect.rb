class Dialect
  def self.translate_for_type(type)
    case type
      when 'pirate'
        @type = Pirate.new
      when 'yoda'
        @type = Yoda.new
      when 'valley'
        @type = Valley.new
      when 'binary'
        @type = Binary.new
    end
    self
  end

  def self.with_message(message)
    @message = message
    self
  end

  def self.result
    @type.call_endpoint(@message).parsed_response
  end
end
