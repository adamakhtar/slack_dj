class User < ApplicationRecord
  has_one :playlist

  validates :slack_id, presence: true
end
