class Tweet < ApplicationRecord
  belongs_to :user
  has_one_attached :image
  has_many :reactions

  validates :tweet, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end

  def liked_by?(user)
    reactions.where(user_id: user.id).exists?
  end

end
