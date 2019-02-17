class QuestionsController < ApplicationController
    
    def index
        @questions = Question.all
    end
    
    def new
        @question = Question.new
    end
    
    def create
        question = Question.new
        question.q_title = params[:question][:q_title]
        question.answer = params[:question][:answer]
        question.type_id = params[:question][:type_id]
        question.resource_name = params[:question][:resource_name]
        question.web_link = params[:question][:web_link]
        user_question.user_id = current_user.id
        question.save
        redirect_to questions_path
    end
    
    def edit
        @question = Question.find(params[:id])
    end
    
    def update
        question = Question.find(params[:id])
        question.q_title = params[:question][:q_title]
        question.answer = params[:question][:answer]
        question.type_id = params[:question][:type_id]
        question.resource_name = params[:question][:resource_name]
        question.web_link = params[:question][:web_link]
        question.save
        redirect_to questions_path
    end
    
    def delete
    end
end
