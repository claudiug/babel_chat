require 'spec_helper'
require_relative '../../app/api/external/yoda_dialect'

describe YodaDialect do

  it 'language convert to yoda will' do
    yoda = YodaDialect.new("Hello girl how are you?", "yoda")
    expect(yoda.translate).to eq  "You?, hello girl how are"
  end
end