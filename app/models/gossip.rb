class Gossip < ApplicationRecord
  belongs_to :user
  has_many :tagged_gossips
  has_many :tags, through: :tagged_gossips
  has_many :comments
end
