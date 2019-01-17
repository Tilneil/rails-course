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
    question = Question.update
    question.question = params[:question]
    question.answer = params[:answer]
    question.flag = params[:flag]
    question.save
    redirect '/questions'
end

get '/questions/home' do
    erb :home
end

get '/questions/guess' do
    @questions = Question.all
    q_no = rand(@questions.length)
    @q = @questions[q_no]
    erb :guess
end

get '/questions/answer' do
    
        @questions = Question.find(params[:id])

    @questions = Question.all
    @q == question.primary_key
    erb :answer
end
