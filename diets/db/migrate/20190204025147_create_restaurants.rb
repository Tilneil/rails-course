class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :logo
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :website
      t.timestamps
    end
  end
end
