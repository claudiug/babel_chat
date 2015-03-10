require 'rails_helper'

describe PirateDialect do
  it 'converts the text in pirate language' do
    stub_request(:get, "http://isithackday.com/arrpi.php?format=json&text=Hello%20mate").
        with(:headers => {'Accept'=>'*/*', 'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3', 'User-Agent'=>'Ruby'}).
        to_return(:status => 200, :body => File.open('../babel_chat/spec/fixtures/arrpi.json'), :headers => {})

    pirate = PirateDialect.new('Hello mate', 'pirate')
    expect(pirate.translate).to include('Avast mate')
  end

  it 'return original message with status is not 200' do
    data = double
    allow(data).to receive(:code).and_return(404)
    allow(HTTParty).to receive(:get).with(any_args).and_return(data)

    pirate = PirateDialect.new('Hello World', 'pirate')
    expect(pirate.translate).to include('Hello World')
  end
end
