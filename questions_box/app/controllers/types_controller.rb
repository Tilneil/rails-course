class TypesController < ApplicationController

    def index
        @types = Type.all
    end
    
    def new
        @type = Type.new
    end
    
    def create
        type = Type.new
        type.title = params[:type][:title]
        type.description = params[:type][:description]
        type.tips = params[:type][:tips]
        type.save
        redirect_to types_path
    end
    
    def edit
        @type = Type.find(params[:id])
    end
    
    def update
        type = Type.find(params[:id])
        type.title = params[:type][:title]
        type.description = params[:type][:description]
        type.tips = params[:type][:tips]
        type.save
        redirect_to types_path
    end
    
    def delete
    end
    
end
