class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :mission
  # validates_uniqueness_of :mission_id, scope: :user_id
end
