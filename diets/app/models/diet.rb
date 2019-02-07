class Diet < ApplicationRecord
    has_many :restaurant_diets
    has_many :restaurants, through: :restaurant_diets
end
