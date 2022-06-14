class Room < ApplicationRecord
  has_many :room_users
  has_many :users, through: :room_users
  has_many :missions
  has_many :favorites
  has_many :taks
end
