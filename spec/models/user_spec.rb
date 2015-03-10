require 'rails_helper'

describe User do

  it 'is valid with all the fields' do
    expect(build(:user)).to be_valid
  end

  it 'is invalid with less than 3 chars' do
    u = build(:user, username: "a")
    u.valid?
    expect(u.errors['username']).to include("is too short (minimum is 3 characters)")
  end

  it 'is invalid with more than 30 chars' do
    u = build(:user, username: "a"* 31)
    u.valid?
    expect(u.errors['username']).to include("is too long (maximum is 30 characters)")
  end

  it 'is invalid with no username' do
    u = build(:user, username: nil)
    u.valid?
    expect(u.errors['username']).to include("can't be blank", "is too short (minimum is 3 characters)")
  end
end