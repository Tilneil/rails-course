class CreateDiets < ActiveRecord::Migration[5.2]
  def change
    create_table :diets do |t|
      t.string :diet_type
      t.string :description
      t.string :website
      t.timestamps
    end
  end
end
