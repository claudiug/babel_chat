class PirateDialect
  include DialectData
  def initialize(message, type)
    @message = message
    @type = type
    @url = 'http://isithackday.com/arrpi.php'
    @data =  prepare_data(@message, @type, @url)
  end

  def translate
    if @data.code != 200
      @message
    else
      JSON.parse(@data.body)['translation']['pirate']
    end
  end

end