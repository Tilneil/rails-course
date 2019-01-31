class VisionsController < ApplicationController

def index
    @visions = Vision.all
end

def new
end

def create
    @visions = Vision.new
    @visions = params[:type]
    @visions = params[:title]
    @visions = params[:artist_author]
    @visions = params[:influence]
    @visions = params[:description]
    @visions = params[:url]
    @visions = params[:goal_id]
    @visions.save
    redirect_to '/'
end

def edit
    @visions = Vision.find_by(id: params[:id])
end

def update
    @visions = Vision.find_by(id: params[:id])
    @visions = params[:type]
    @visions = params[:title]
    @visions = params[:artist_author]
    @visions = params[:influence]
    @visions = params[:description]
    @visions = params[:url]
    @visions = params[:goal_id]
    @visions.save
    redirect_to '/'
end

def destroy
    @visions = Vision.find_by(id: params[:id])
    @visions.destroy
    redirect_to '/'
end
end
