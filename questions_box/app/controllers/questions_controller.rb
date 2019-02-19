class QuestionsController < ApplicationController
    
    skip_before_action :verify_authenticity_token

    before_action :authenticate_user!
    
    def index
        @questions = Question.all
        query = "%#{params[:type_id]}%"
        @type = Type.where("id LIKE ?", query)
        
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
    
    def add
        @questions = Question.find(params[:id])
        user_question = UserQuestion.new
        user_question.question_id = params[:id]
        user_question.user_id = current_user.id
        user_question.save
        redirect_to questions_view_path(@questions)
    end
    
    def view
        @user_question = UserQuestion.all
    end
    
   
    def remove
        @current_user = UserQuestion.find(params[:id])
        @user_question.destroy
        redirect_to questions_view_path(@questions)
    end
end
