# require '../helpers/restaurant_helper'

class RestaurantsController < ApplicationController
  
  include RestaurantsHelper

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.create(restaurant_params)
    redirect_to '/restaurants'
  end

  def show
    puts params
    @restaurant = Restaurant.find(params[:id])
    puts @restaurant
  end
end
