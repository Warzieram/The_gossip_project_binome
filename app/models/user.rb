class User < ApplicationRecord
  validates :city, presence: true, uniqueness: true
  validates :gossip, presence: true

  def name
    "#{first_name} #{last_name}"
  end

  belongs_to :city
  has_many :gossips
  has_many :sent_messages, foreign_key: "sender_id", class_name: "PrivateMessage"
  has_many :received_messages, foreign_key: "recipient_id", class_name: "PrivateMessage"
end
