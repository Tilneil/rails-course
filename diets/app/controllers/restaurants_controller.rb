class RestaurantsController < ApplicationController
    def index  #Read, lists everything
        @restaurant = Restaurant.all
    end
    
    def show #Read, shows just for items selected
        @restaurant = Restaurant.find(params[:id])
        @diet = Diet.all
    end
    
    def new
        @restaurant = Restaurant.new
    end
    
    def create
        @restaurant = Restaurant.new
        @restaurant.logo = params[:restaurant][:logo]
        @restaurant.name = params[:restaurant][:name]
        @restaurant.address = params[:restaurant][:address]
        @restaurant.city = params[:restaurant][:city]
        @restaurant.state = params[:restaurant][:state]
        @restaurant.zip = params[:restaurant][:zip]
        @restaurant.website = params[:restaurant][:website]
        @restaurant.save
        redirect_to '/restaurants'
    end
    
    def edit
        @restaurant = Restaurant.find(params[:id])
    end
    
    def update
        @restaurant = Restaurant.find(params[:id])
        @restaurant.logo = params[:restaurant][:logo]
        @restaurant.name = params[:restaurant][:name]
        @restaurant.address = params[:restaurant][:address]
        @restaurant.city = params[:restaurant][:city]
        @restaurant.state = params[:restaurant][:state]
        @restaurant.zip = params[:restaurant][:zip]
        @restaurant.website = params[:restaurant][:website]
        @restaurant.save
        redirect_to '/restaurants'
    end
    
    def add_diet
        restaurant = Restaurant.find(params[:restaurant_id])
        restaurant_diet = RestaurantDiet.new
        restaurant_diet.restaurant_id = params[:restaurant_id]
        restaurant_diet.diet_id = params[:diet_id]
        restaurant_diet.save
        redirect_to restaurant_path(restaurant.id)
    end
    
    def destroy
        @restaurant = Restaurant.find(params[:id])
        @restaurant.destroy
        redirect_to '/restaurants'
    end
end
