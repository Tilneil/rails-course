class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
        t.string :first_name
        t.string :last_name
        t.integer :phone_number
        t.string :email
        t.string :address
        t.string :city
        t.string :state
        t.integer :zip_code
     end
  end
end
