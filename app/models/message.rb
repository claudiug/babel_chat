class Message
  include ActiveModel::Model
  attr_accessor :content
  validates :content, presence: true
  validates :content, length: { within: 3..300 }
end
