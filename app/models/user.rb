class User < ApplicationRecord
  has_one :playlist
  has_many :videos
  belongs_to :team, optional: true
  acts_as_list scope: :team

  validates :slack_id, presence: true
end
