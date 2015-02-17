# require '../helpers/restaurant_helper'

class RestaurantsController < ApplicationController
  
  include RestaurantsHelper

  def index
    @restaurants = Restaurant.all
  end

  def new
  end

  def create
    Restaurant.create(restaurant_params)
    redirect_to '/restaurants'
  end
end
