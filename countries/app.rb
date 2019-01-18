require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, {adapter: 'sqlite3', database: 'test.db'}

class Question < ActiveRecord::Base
end

get '/questions' do
    @questions = Question.all
    erb :questions
end

get '/questions/new' do
    erb :new
end

post '/questions' do
    question = Question.new
    question.question = params[:question]
    question.answer = params[:answer]
    question.flag = params[:flag]
    question.save
    redirect '/questions'
end

get '/questions/edit' do
    @questions = Question.find(params[:id])
    erb :edit
end

post '/questions/edit' do
    @questions = Question.find(params[:id])
    @questions.question = params[:question]
    @questions.answer = params[:answer]
    @questions.flag = params[:flag]
    @questions.save
    redirect '/questions/edit'
end

get '/' do
    erb :home
end

get '/guessa' do
    questions = Question.all
    index = rand(questions.length)
    @question = questions[index]
    erb :guessa
end

get '/answer' do
    @question = Question.find(params[:id])
    erb :answer
end

#use variables that you can say out loud
# the @ symbols makes it similar to a globa variable that can be accessed anywhere in the app
    
# get '/guess' do
# @questions = Question.all
# q_no = rand(@questions.length)
# @q = @questions[q_no]
#     erb :guess
# end

# get '/answer' do
# @questions = Question.all
# q_no = rand(@questions.length)
# @q = @questions[q_no]
#     erb :answer
# end
