class ActivityLevel < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '多い' },
    { id: 3, name: '普通' },
    { id: 4, name: '少ない' }
  ]

  include ActiveHash::Associations
  has_many :users

  end