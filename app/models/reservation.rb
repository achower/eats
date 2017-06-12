class Reservation < ApplicationRecord
  belongs_to :restaurant

  validates :reservee_email, presence: true
  validates :dining_date, presence: true
  validates :note, presence: true
end
