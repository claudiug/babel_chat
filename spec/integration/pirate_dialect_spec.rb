require 'spec_helper'
require_relative '../../app/api/external/pirate_dialect'

describe PirateDialect do

  it 'converts the text in pirate language' do
    pirate = PirateDialect.new("Hello mate", "pirate")
    expect(pirate.translate).to include("Avast mate")
  end

end