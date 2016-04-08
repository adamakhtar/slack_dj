class Player < ApplicationRecord
  STATUSES = ['stopped', 'playing']

  validates :status, inclusion: { in: STATUSES }
end