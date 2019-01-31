class Mood < ApplicationRecord
    def change
        create_table :moods do |t|
          t.string :image
          t.string :mood
          t.string :description
          t.timestamps
      end
    end
end
