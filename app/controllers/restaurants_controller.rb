class RestaurantsController < ApplicationController
  before_action :restrict_restaurants, only: [:edit, :update, :destroy]
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def edit
  end

  def create
    @restaurant = current_user.restaurants.new(restaurant_params)

    if @restaurant.save
      redirect_to @restaurant, notice: "Successfully created restaurant"
    else
      render 'new'
    end
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to @restaurant, notice: "Restaurant successfully updated"
    else
      render 'edit'
    end
  end

  def destroy
    @restaurant.destroy

    redirect_to restaurants_path
  end

  private

    def restrict_restaurants
      @restaurant = Restaurant.find(params[:id])

      unless current_user == @restaurant.user
        redirect_to(restaurants_path, notice: "You are not the owner of this Restaurant!")
      end
    end

    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    def restaurant_params
      params.require(:restaurant).permit(:name, :genre, :phone, :address)
    end
end
