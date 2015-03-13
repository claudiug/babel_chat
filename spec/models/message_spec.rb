require 'rails_helper'

describe Message do
  it 'is valid with all the fields' do
    expect(build(:message)).to be_valid
  end

  it 'is invalid with less than 3 chars' do
    m = build(:message, content: 'a')
    m.valid?
    expect(m.errors['content']).to include('is too short (minimum is 3 characters)')
  end

  it 'is invalid with more than 300 chars' do
    m = build(:message, content: 'a' * 301)
    m.valid?
    expect(m.errors['content']).to include('is too long (maximum is 300 characters)')
  end

  it 'is invalid with no content' do
    m = build(:message, content: nil)
    m.valid?
    expect(m.errors['content']).to include("can't be blank", 'is too short (minimum is 3 characters)')
  end
end
