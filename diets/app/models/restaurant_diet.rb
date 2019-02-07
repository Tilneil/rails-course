class RestaurantDiet < ApplicationRecord
    belongs_to :restaurant
    belongs_to :diet
end
