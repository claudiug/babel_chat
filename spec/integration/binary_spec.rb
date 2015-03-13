require 'rails_helper'

describe Binary do
  it 'converts the text in binary' do
    b = Binary.new
    expect(b.call_endpoint('foo').parsed_response).to eq ['011001100110111101101111']
  end
end
