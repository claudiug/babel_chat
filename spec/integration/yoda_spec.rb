require 'rails_helper'

describe Yoda do
  it 'language convert to yoda will' do
    stub_request(:get, 'http://www.degraeve.com/cgi-bin/babel.cgi?d=yoda&w=Hello%20girl%20how%20are%20you?')
      .with(headers: { 'Accept' => '*/*', 'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent' => 'Ruby' })
      .to_return(status: 200, body: File.open('../babel_chat/spec/fixtures/yoda.html'), headers: {})
    yoda = Yoda.new
    expect(yoda.call_endpoint('Hello girl how are you?').parsed_response).to eq 'You?, hello girl how are'
  end

  it 'return original message with status is not 200' do
    stub_request(:get, 'http://www.degraeve.com/cgi-bin/babel.cgi?d=yoda&w=Hello%20world')
      .with(headers: { 'Accept' => '*/*', 'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent' => 'Ruby' })
      .to_return(status: 404, body: 'Hello world', headers: {})

    yoda = Yoda.new
    expect(yoda.call_endpoint('Hello world').parsed_response).to include('Hello world')
  end
end
