class Pirate
  include HTTParty
  base_uri @url
  def initialize
    @url = 'http://isithackday.com/arrpi.php'
  end

  def call_endpoint(message)
    @message = message
    @result = self.class.get(("#{@url}?text=#{@message}&format=json"))
    self
  end

  def parsed_response
    if @result.code == 200
      JSON.parse(@result.body)['translation']['pirate']
    else
      @message
    end
  end
end
