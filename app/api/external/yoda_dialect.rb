require 'nokogiri'

class YodaDialect
  include DialectData

  def initialize(message, type)
    @message = message
    @type = type
    @url = 'http://www.degraeve.com/cgi-bin/babel.cgi?d='
    @data = prepare_data(@message, @type, @url)
  end

  def translate
    if @data.code != 200
      @message
    else
      Nokogiri::HTML(@data.body).css('blockquote > p').children.text.strip
    end
  end
end