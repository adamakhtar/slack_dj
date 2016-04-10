class Team < ApplicationRecord
  validates :slack_id, presence: true
  has_many :users
end
