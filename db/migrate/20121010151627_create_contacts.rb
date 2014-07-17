class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :client_id
      t.string :name
      t.string :phone
      t.string :cellphone
      t.string :email
      t.text :comment

      t.timestamps
    end
  end
end
