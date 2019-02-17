class CreateGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :goals do |t|
          t.string :image
          t.date :deadline
          t.string :goal_type
          t.string :description
          t.timestamps
    end
  end
end