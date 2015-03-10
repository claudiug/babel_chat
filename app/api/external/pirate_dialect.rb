require 'open-uri'
class PirateDialect
  def initialize(message)
    @message = message
    @url = 'http://isithackday.com/arrpi.php?text=hello&format=json'
  end

  def translate
    data = open(build_url).read
    JSON.parse(data)['translation']['pirate']
  end

  private
  def build_url
    "#{@url}?text=#{@message}&format=json"
  end
end