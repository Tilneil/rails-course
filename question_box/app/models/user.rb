class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :user_question
  has_many :questions, through :user_questions
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
