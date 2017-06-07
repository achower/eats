class Restaurant < ApplicationRecord
  validates :name, presence: true, length: { minimum: 5 }
  validates :phone, :allow_blank => true, length: { minimum: 10 }

  belongs_to :user
end
