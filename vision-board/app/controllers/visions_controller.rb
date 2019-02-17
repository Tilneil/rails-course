class VisionsController < ApplicationController


def index
    @visions = Vision.all
    @goals = Goal.all
end

def new
    @goals = Goal.all
end

def create
    visions = Vision.new
    visions.title = params[:title]
    visions.artist_author = params[:artist_author]
    visions.description = params[:description]
    visions.url = params[:url]
    visions.goal_id = params[:goal_id]
    visions.save
    redirect_to '/visions'
end

def edit
    @visions = Vision.find_by(id: params[:id])
    @goals = Goal.all

end

def update
    visions = Vision.find_by(id: params[:id])
    visions.title = params[:title]
    visions.artist_author = params[:artist_author]
    visions.description = params[:description]
    visions.url = params[:url]
    visions.goal_id = params[:goal_id]
    visions.save
    redirect_to '/visions'
end

def destroy
    @visions = Vision.find_by(id: params[:id])
    @visions.destroy
    redirect_to '/visions'
end
end
