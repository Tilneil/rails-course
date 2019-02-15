class Question < ApplicationRecord
    belongs_to :type
    belongs_to :user_question
    has_many :users, through :user_questions 
end
