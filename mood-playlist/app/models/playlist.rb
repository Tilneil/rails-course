class Playlist < ApplicationRecord
    def change
        create_table :moods do |t|
          t.string :title
          t.string :artist_author
          t.string :description
          t.string :url
          t.integer :mood_id
          t.timestamps
      end
    end
end
