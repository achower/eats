class ReservationsController < ApplicationController
  before_action :authenticate_user!, only: [:destroy]
  before_action :restrict_reject, only: [:destroy]

  def new
    @reservation = Reservation.new
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = @restaurant.reservations.new(reservation_params)

    if verify_recaptcha(model: @reservation) && @reservation.save
      redirect_to restaurant_path(@restaurant), notice: "Successfully created restaurant"
    else
      redirect_to restaurant_path(@restaurant), notice: "Please verify your not a robot"
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = @restaurant.reservations.find(params[:id])
    @reservation.destroy
    redirect_to restaurant_path(@restaurant)
  end

  private
    def restrict_reject
      @restaurant = Restaurant.find(params[:restaurant_id])

      unless current_user == @restaurant.user
        redirect_to(restaurant_path(@restaurant), notice: "You are not the owner of this Restaurant!")
      end
    end

    def reservation_params
      params.require(:reservation).permit(:reservee_email, :dining_date, :note)
    end
end

