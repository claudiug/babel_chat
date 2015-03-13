require 'rails_helper'

describe Valley do
  it 'converts the text in valley girl language' do
    stub_request(:get, 'http://www.degraeve.com/cgi-bin/babel.cgi?d=valley&w=Hello%20girl%20how%20are%20like%20you?')
      .with(headers: { 'Accept' => '*/*', 'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent' => 'Ruby' })
      .to_return(status: 200, body: File.open('../babel_chat/spec/fixtures/valley.html'), headers: {})

    b = Valley.new
    expect(b.call_endpoint('Hello girl how are like you?').parsed_response).to eq 'Hello girl how are like you?'
  end

  it 'return original message with status is not 200' do
    stub_request(:get, 'http://www.degraeve.com/cgi-bin/babel.cgi?d=valley&w=Hello')
      .with(headers: { 'Accept' => '*/*', 'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent' => 'Ruby' })
      .to_return(status: 404, body: 'Hello', headers: {})
    valley = Valley.new
    expect(valley.call_endpoint('Hello').parsed_response).to include('Hello')
  end
end
