class CreateUserQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :user_questions do |t|
      t.string :user_id
      t.string :question_id
      t.timestamps
    end
  end
end
