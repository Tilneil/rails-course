class Restaurant < ApplicationRecord
    has_many :restaurant_diets
    has_many :diets, through: :restaurant_diets
end
