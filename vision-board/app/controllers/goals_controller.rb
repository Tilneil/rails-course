class GoalsController < ApplicationController

def index
    @goals = Goal.all
end

def new
end

def create
    @goals = Goal.new
    @goals = params[:image]
    @goals = params[:deadline]
    @goals = params[:goal_type]
    @goals = params[:description]
    @goals.save
    redirect_to '/'
end

def edit
    @goals = Goal.find_by(id: params[:id])
end

def update
    @goals = Goal.find_by(id: params[:id])
    @goals = params[:image]
    @goals = params[:deadline]
    @goals = params[:goal_type]
    @goals = params[:description]
    @goals.save
    redirect_to '/'
end

def delete
    @goals = Goal.find_by(id: params[:id])
    @goals.destroy
     redirect_to '/'
end
end

