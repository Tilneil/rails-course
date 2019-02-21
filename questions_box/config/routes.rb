Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 
  get '/user_questions/view' => 'user_questions#view'

 
  resources :questions 
  
  resources :user_questions do
    member do
      get :add
      post :add
      delete :remove
    end
  end
  
  resources :types
  
  root 'questions#index'
  
  get '/questions/search' => 'questions#search'
  
  get '/questions/results' => 'questions#results'
  
  post '/questions/results' => 'questions#results'

  
  get '/user_questions/search' => 'user_questions#search'
  
  get '/user_questions/results' => 'user_questions#results'
  
  post '/user_questions/results' => 'user_questions#results'

end
