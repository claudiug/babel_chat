class User
  include ActiveModel::Model
  attr_accessor :username
  validates :username, presence: true
  validates :username, length: { within: 3..30 }
end
