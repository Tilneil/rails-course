Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :questions
  resources :types
  root 'questions#index'
  post 'questions/add_type' => 'questions#add_type'
      
  get '/questions/search' => 'questions#search'
    
    get '/questions/results' => 'questions#results'
    post '/questions/results' => 'questions#results'
end
