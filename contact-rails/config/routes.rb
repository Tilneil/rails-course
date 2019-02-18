Rails.application.routes.draw do
    get '/contacts' => 'contacts#index'
    
    get '/contacts/new' => 'contacts#new'
    post '/contacts' => 'contacts#create'
    
    get '/contacts/edit' => 'contacts#edit'
    post '/contacts/edit' => 'contacts#update'
    
    get '/contacts/destroy' => 'contacts#destroy'
    
    get '/contacts/search' => 'contacts#search'
    
    get '/contacts/results' => 'contacts#results'
    post '/contacts/results' => 'contacts#results'

end
