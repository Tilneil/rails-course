class DietsController < ApplicationController
    def index  #Read, lists everything
        @diet = Diet.all
    end
    
    def show #Read, shows just for items selected
        @diet = Diet.find(params[:id])
        @restaurant = Restaurant.all
    end
    
    def new
        @diet = Diet.new
    end
    
    def create
        @diet = Diet.new
        @diet.diet_type = params[:diet][:diet_type]
        @diet.description = params[:diet][:description]
        @diet.website = params[:diet][:website]
        @diet.save
        redirect_to '/diets'
    end
    
    def edit
        @diet = Diet.find(params[:id])
    end
    
    def update
        @diet = Diet.find(params[:id])
        @diet.diet_type = params[:diet][:diet_type]
        @diet.description = params[:diet][:description]
        @diet.website = params[:diet][:website]
        @diet.save
        redirect_to '/diets'
    end
    
    def destroy
        @diet = Diet.find(params[:id])
        @diet.destroy
        redirect_to '/diets'
    end
end
