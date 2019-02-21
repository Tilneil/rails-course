class UserQuestionsController < ApplicationController
    
    skip_before_action :verify_authenticity_token
    
    before_action :authenticate_user!
    
    def index   
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
        @user_question = UserQuestion.new
        @user_question.question_id = params[:id]
        @user_question.user_id = current_user.id
        @user_question.save
        redirect_to user_questions_view_path(@questions)
        
        # @questions = Question.find(params[:id])
        # user_question = UserQuestion.new
        # user_question.question_id = params[:question_id]
        # user_question.user_id = current_user.id
        # user_question.save
        # redirect_to user_questions_view_path(@questions)
        
        #   @question.q_title = params[:question][:q_title]
        # @question.answer = params[:question][:answer]
        # @question.type_id   = params[:type_id]
        # @question.resource_name = params[:question][:resource_name]
        # @question.web_link = params[:question][:web_link]
    end

    def view
        @user_question = UserQuestion.all
        @questions = Question.all
        @type = Type.all
    end
    
        #     @restaurant = Restaurant.find(params[:id])
        # @diet = Diet.all
    
    
    #     def add_diet
    #     restaurant = Restaurant.find(params[:restaurant_id])
    #     restaurant_diet = RestaurantDiet.new
    #     restaurant_diet.restaurant_id = params[:restaurant_id]
    #     restaurant_diet.diet_id = params[:diet_id]
    #     restaurant_diet.save
    #     redirect_to restaurant_path(restaurant.id)
    # end
    
    # def destroy
    #     @restaurants = Restaurant.find(params[:id])
    #     @restaurant.destroy
    #     redirect_to '/restaurants'
      
    def remove
         
        @user_question = UserQuestion.find(params[:id])
        @user_question.destroy
        redirect_to user_questions_view_path(@questions)
 
    #  @question = Question.find(params[:id])
    #     @question.destroy
    #     redirect_to questions_path 
 
    # def destroy
    #     # @user_question = UserQuestion.all


    #     # @questions = Question.find(params[:id])
    #     # @user_question = UserQuestion.find(params[:id])
    #     # user_question.question_id = params[:id]
    #     @user_question = UserQuestion.find(params[:id])
    #     @user_question.destroy
    #     redirect_to user_questions_view_path(@questions)
    end
end
