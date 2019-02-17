class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :q_title
      t.string :answer
      t.string :type_id
      t.string :resource_name
      t.string :web_link
      t.timestamps
    end
  end
end
