class QuestionsController < ApplicationController
    
    skip_before_action :verify_authenticity_token

    def index
        @questions = Question.all
        @type = Type.all
        # query = "%#{params[:type_id]}%"
        # @type = Type.where("id LIKE ?", query)
        
        # @questions = Question.where(user_id: current_user.id)
    end
    
    def new
        @question = Question.new
        @type = Type.all
    end
    
    def create
        @type = Type.all
        @question = Question.new
        @question.q_title = params[:question][:q_title]
        @question.answer = params[:question][:answer]
        @question.type_id   = params[:type_id]
        @question.resource_name = params[:question][:resource_name]
        @question.web_link = params[:question][:web_link]
        @question.save
        redirect_to questions_path
    end
    
    def edit
        @type = Type.all
        @question = Question.find(params[:id])
    end
    
    def update
        @type = Type.all
        question = Question.find(params[:id])
        question.q_title = params[:question][:q_title]
        question.answer = params[:question][:answer]
        question.type_id   = params[:type_id]
        question.resource_name = params[:question][:resource_name]
        question.web_link = params[:question][:web_link]
        question.save
        redirect_to questions_path
    end
    
    def destroy
        @question = Question.find(params[:id])
        @question.destroy
        redirect_to questions_path 
    end
    
    def search
        @questions = Question.all
        @type = Type.all
    end
       
    def results
        query = "%#{params[:query]}%"
        @questions = Question.where("q_title LIKE ?", query) 
        @type = Type.all
    end
end
