class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :question_title
      t.string :answer
      t.string :type_id
      t.string :resources
      t.timestamps
    end
  end
end
