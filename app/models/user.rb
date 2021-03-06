class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :missions, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :room_users
  has_many :rooms, through: :room_users
  #  has_many :favorited_missions, through: :favorites, source: :mission
end
