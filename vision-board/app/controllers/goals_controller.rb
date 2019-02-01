class GoalsController < ApplicationController


def index
    @goals = Goal.all
end

def new
    @visions = Vision.all
end

def create
    goals = Goal.new
    goals.image = params[:image]
    goals.deadline = params[:deadline]
    goals.goal_type = params[:goal_type]
    goals.description = params[:description]
    goals.save
    redirect_to '/goals'
end

def edit
    @goals = Goal.find_by(id: params[:id])
end

def update
    @goals = Goal.find_by(id: params[:id])
    @goals.image = params[:image]
    @goals.deadline = params[:deadline]
    @goals.goal_type = params[:goal_type]
    @goals.description = params[:description]
    @goals.save
    redirect_to '/goals'
end

def delete
    @goals = Goal.find_by(id: params[:id])
    @goals.destroy
     redirect_to '/goals'
end

def show
   @goals = Goal.find_by(id: params[:id]) 
   @vision = Vision.find_by(id: params[:id])
end
end

