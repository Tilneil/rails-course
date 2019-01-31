class CreateVisions < ActiveRecord::Migration[5.2]
  def change
    create_table :visions do |t|
          t.string :type
          t.string :title
          t.string :artist_author
          t.string :influence
          t.string :description
          t.string :url
          t.integer :goal_id
          t.timestamps
    end
  end
end
