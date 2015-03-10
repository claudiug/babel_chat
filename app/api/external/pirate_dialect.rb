require 'httparty'
class PirateDialect
  def initialize(message)
    @message = message
    @url = 'http://isithackday.com/arrpi.php'
  end

  def translate
    data = HTTParty.get(build_url).body
    JSON.parse(data)['translation']['pirate']
  end

  private
  def build_url
    "#{@url}?text=#{@message}&format=json"
  end
end