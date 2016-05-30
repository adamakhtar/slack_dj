class Team < ApplicationRecord
  validates :slack_id, presence: true
  has_many :users, -> { order("position ASC") }, dependent: :destroy
  has_one :player, dependent: :destroy
  has_one :playlist, dependent: :destroy

  def user_rota
    @user_rota ||= UserRota.new(self)
  end
end
