class StarsController < ApplicationController
  respond_to :js

  def star
    @user = current_user
    @restaurant = Restaurant.find(params[:restaurant_id])
    @user.star!(@restaurant)
  end

  def unstar
    @user = current_user
    @star = @user.stars.find_by_restaurant_id(params[:restaurant_id])
    @restaurant = Restaurant.find(params[:restaurant_id])
    @star.destroy!
  end
end
