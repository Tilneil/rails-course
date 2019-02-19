class UserQuestionsController < ApplicationController
    
    skip_before_action :verify_authenticity_token

    # before_action :authenticate_user!
    
    def index
        @user_questions = UserQuestion.all
        query = "%#{params[:type_id]}%"
        @type = Type.where("id LIKE ?", query)
        
        # @questions = Question.where(user_id: current_user.id)
    end
end
