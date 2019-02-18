class CreateRestaurantDiets < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurant_diets do |t|
      t.integer :restaurant_id
      t.integer :diet_id
    end
  end
end
