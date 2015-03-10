require 'rails_helper'

describe YodaDialect do
  it 'language convert to yoda will' do
    stub_request(:get, "http://www.degraeve.com/cgi-bin/babel.cgi?d=yoda&w=Hello%20girl%20how%20are%20you?").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => File.open('../babel_chat/spec/fixtures/yoda.html'), :headers => {})
    yoda = YodaDialect.new('Hello girl how are you?', 'yoda')
    expect(yoda.translate).to eq 'You?, hello girl how are'
  end

  it 'return original message with status is not 200' do
    data = double
    allow(data).to receive(:code).and_return(404)
    allow(HTTParty).to receive(:get).with(any_args).and_return(data)

    pirate = YodaDialect.new('Hello World', 'pirate')
    expect(pirate.translate).to include('Hello World')
  end
end
