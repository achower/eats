class RestaurantsController < ApplicationController
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
      redirect_to @restaurant
    else
      render 'new'
    end
  end

  def update
    if @restaurant.update(article_params)
      redirect_to @restaurant
    else
      render 'edit'
    end
  end

  def destroy
    @restaurant.destroy

    redirect_to restaurants_path
  end

  private

    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    def restaurant_params
      params.require(:restaurant).permit(:name, :genre, :phone, :address)
    end
end
