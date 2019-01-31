Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
    get '/visions' => 'visions#index'
    
    get '/visions/new' => 'visions#new'
    post '/visions' => 'visions#create'
    
    get '/visions/edit' => 'visions#edit'
    post '/visions/edit' => 'visions#update'
    
    get '/visions/destroy' => 'visions#destroy'
    
    
    get '/goals' => 'goals#index'

    get '/goals/new' => 'goals#new'
    post '/' => 'goals#create'
    
    get '/goals/edit' => 'goals#edit'
    post '/goals/edit' => 'goals#update'
    
    get '/goals/destroy' => 'goals#destroy'

end
