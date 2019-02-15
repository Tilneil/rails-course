class CreateTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :types do |t|
      t.string :question_type
      t.string :description
      t.string :facilitator_tip
      t.timestamps
    end
  end
end
