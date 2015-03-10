require 'rails_helper'

describe ValleyGirlDialect do
  it 'converts the text in valley girl language' do
    stub_request(:get, "http://www.degraeve.com/cgi-bin/babel.cgi?d=valley&w=Hello%20girl%20how%20are%20you?").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => File.open('../babel_chat/spec/fixtures/valley.html'), :headers => {})

    b = ValleyGirlDialect.new('Hello girl how are you?', 'valley')
    expect(b.translate).to eq 'Hello girl how are like you?'
  end

  it 'return original message with status is not 200' do
    data = double
    allow(data).to receive(:code).and_return(404)
    allow(HTTParty).to receive(:get).with(any_args).and_return(data)

    pirate = ValleyGirlDialect.new('Hello Girl', 'valley')
    expect(pirate.translate).to include('Hello Girl')
  end
end
