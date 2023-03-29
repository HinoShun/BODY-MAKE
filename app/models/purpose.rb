class Purpose < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'BULK UP' },
    { id: 3, name: 'BURN FAT' },
    { id: 4, name: 'KEEP' }
  ]

  include ActiveHash::Associations
  has_many :users

  end