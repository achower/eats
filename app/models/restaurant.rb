class Restaurant < ApplicationRecord
  belongs_to :user
  has_many :reservations, dependent: :destroy
  accepts_nested_attributes_for :reservations

  validates :name, presence: true, length: { minimum: 3 }
  validates :phone, :allow_blank => true, length: { minimum: 10 }

end
