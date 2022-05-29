class Mission < ApplicationRecord
  validates :mission, presence: true
  validates :startdate, presence: true
  validates :limitdate, presence: true

  has_many :tasks, dependent: :destroy

end
