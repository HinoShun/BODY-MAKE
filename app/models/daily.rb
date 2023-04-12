class Daily < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :input_day, presence: true
  validates :weight,    presence: true
  validates :fat,       presence: true
end
