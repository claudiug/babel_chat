require 'httparty'

module DialectData

  module_function
  def prepare_data(message, type, url)
    if type == 'pirate'
      HTTParty.get("#{url}?text=#{message}&format=json")
    else
      HTTParty.get("#{url}#{type}&w=#{message}")
    end
  end
end