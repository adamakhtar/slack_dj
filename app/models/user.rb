class User < ApplicationRecord
  has_one :playlist
  belongs_to :team, optional: true

  validates :slack_id, presence: true
end
