class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :nit
      t.string :name
      t.string :address
      t.string :city
      t.string :phone
      t.string :web
      t.string :email
      t.text :comment

      t.timestamps
    end
  end
end
