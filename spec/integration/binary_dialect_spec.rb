require 'spec_helper'
require_relative '../../app/api/external/binary_dialect'

describe BinaryDialect do

  it 'converts the text in binary' do
    b = BinaryDialect.new("foo")
    expect(b.translate).to eq ['011001100110111101101111']
  end

end