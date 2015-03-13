require 'rails_helper'

describe Pirate do
  it 'converts the text in pirate language' do
    stub_request(:get, 'http://isithackday.com/arrpi.php?format=json&text=Hello%20mate')
      .with(headers: { 'Accept' => '*/*', 'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent' => 'Ruby' })
      .to_return(status: 200, body: File.open('../babel_chat/spec/fixtures/arrpi.json'), headers: {})

    pirate = Pirate.new
    expect(pirate.call_endpoint('Hello mate').parsed_response).to include('Avast mate')
  end

  it 'return original message with status is not 200' do
    stub_request(:get, 'http://isithackday.com/arrpi.php?format=json&text=Hello')
      .with(headers: { 'Accept' => '*/*', 'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent' => 'Ruby' })
      .to_return(status: 404, body: 'Hello', headers: {})

    pirate = Pirate.new
    expect(pirate.call_endpoint('Hello').parsed_response).to include('Hello')
  end
end
