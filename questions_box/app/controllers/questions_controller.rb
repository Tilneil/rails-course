class QuestionsController < ApplicationController
    
    def index
        @type = Type.all
        @question = Question.all
    end
    
    def new
        @question = Question.new
    end
    
    def create
        @type = Type.all
        question = Question.new
        question.q_title = params[:question][:q_title]
        question.answer = params[:question][:answer]
        question.type_id   = params[:type_id]
        question.resource_name = params[:question][:resource_name]
        question.web_link = params[:question][:web_link]
        question.save
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
    
    def delete
    end
end
