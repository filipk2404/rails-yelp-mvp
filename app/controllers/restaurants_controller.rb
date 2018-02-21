class RestaurantsController < ApplicationController

  before_action :find_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def create
    @restaurant = Restaurant.create(restaurant_params)
    redirect_to restaurants_path
  end

  def new
    @restaurant = Restaurant.new
  end

  def edit

  end

  def show
    @reviews = Review.all
  end

  def update
    @restaurant.update(restaurant_params)
       redirect_to restaurants_path
  end

  def destroy
    @restaurant.destroy
        redirect_to restaurants_path
  end

  private
  def restaurant_params
      params.require(:restaurant).permit(:name, :address, :phone_number, :category)
    end

    def find_restaurant
       @restaurant = Restaurant.find(params[:id])
     end

end
