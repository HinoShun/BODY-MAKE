class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  extend ActiveHash::Associations::ActiveRecordExtensions

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :tweets
  has_many :dailies
  has_one_attached :image
  has_many :reactions
  has_many :comments

  belongs_to :sex
  belongs_to :purpose
  belongs_to :activity_level
  belongs_to :publish_target
  belongs_to :publish_daily
  belongs_to :publish_height
  belongs_to :publish_tweet

  validates   :year_of_birth, presence: true, format: { with: /\A[0-9]{4}\z/ }
  validates   :height,        presence: true, numericality: { only_integer: true }

  with_options numericality: { other_than: 1 } do
    validates :sex_id
    validates :purpose_id
    validates :activity_level_id
    validates :publish_target_id
    validates :publish_daily_id
    validates :publish_height_id
    validates :publish_tweet_id
  end

end
