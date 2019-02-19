Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
 
   get '/questions/view' => 'questions#view'
 
  resources :questions do
    member do
      get :add
      post :add
      post :remove
    end
  end
  resources :types
  root 'questions#index'
  
  get '/questions/search' => 'questions#search'
  
    get '/questions/results' => 'questions#results'
    post '/questions/results' => 'questions#results'
end
