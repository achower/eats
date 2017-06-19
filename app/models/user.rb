class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, presence: true, length: { minimum: 2 }
  validates :last_name, presence: true, length: { minimum: 2 }

  has_many :restaurants
  has_many :stars, dependent: :destroy
  has_many :starred_restaurants, source: :restaurant, through: :stars

  # creates a new star row with restaurant_id and user_id
  def star!(restaurant)
    self.stars.create!(restaurant_id: restaurant.id)
  end

  # destroys a star with matching restaurant_id and user_id
  def unstar!(restaurant)
    star = self.stars.find_by_restaurant_id(restaurant.id)
    star.destroy!
  end

  # returns true of false if a post is starred by user
  def star?(restaurant)
    self.stars.find_by_restaurant_id(restaurant.id)
  end

end
