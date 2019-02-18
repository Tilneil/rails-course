Rails.application.routes.draw do
    resources :restaurants
    resources :diets
    resources :restaurant_diets
    post 'restaurants/add_diet' => 'restaurants#add_diet'
end
