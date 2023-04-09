class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :tweet

  validates :tweet, presence: true
end
