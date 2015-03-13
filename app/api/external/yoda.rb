class Yoda
  include HTTParty

  def initialize
    @url = 'http://www.degraeve.com/cgi-bin/babel.cgi?d=yoda'
  end

  def call_endpoint(message)
    @message = message
    @result = self.class.get("#{@url}&w=#{@message}")
    self
  end

  def parsed_response
    if @result.code == 200
      Nokogiri::HTML(@result.body).css('blockquote > p').children.text.strip
    else
      @message
    end
  end
end
