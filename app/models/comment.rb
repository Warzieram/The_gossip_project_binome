class Comment < ApplicationRecord
  has_many :gossips
  belongs_to :user
end
