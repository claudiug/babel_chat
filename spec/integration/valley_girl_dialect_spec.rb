require 'spec_helper'
require_relative '../../app/api/external/valley_girl_dialect'

describe ValleyGirlDialect do

  it 'converts the text in valley girl language' do
    b = ValleyGirlDialect.new("Hello girl how are you?", "valley")
    expect(b.translate).to eq "Hello girl how are like you?"
  end

end