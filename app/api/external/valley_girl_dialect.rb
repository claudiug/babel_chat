class ValleyGirlDialect
  require 'nokogiri'
  require 'open-uri'

  def initialize(message, type)
    @message = message
    @type = type
    @url = 'http://www.degraeve.com/cgi-bin/babel.cgi?d='
  end

  def translate
    data = Nokogiri::HTML(open(build_url))
    data.css('blockquote > p').children.text.strip
  end

  private

  def build_url
    "#{@url}#{@type}&w=#{@message}"
  end
end