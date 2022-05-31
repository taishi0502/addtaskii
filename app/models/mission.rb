class Mission < ApplicationRecord
  validates :mission, presence: true
  validates :startdate, presence: true
  validates :limitdate, presence: true

  has_many :tasks, dependent: :destroy
  belongs_to :user
  has_many :favorites, dependent: :destroy
  # has_many :favorited_users, through: :favorites, source: :user

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

end
