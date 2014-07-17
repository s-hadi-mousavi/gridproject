class CreateDevelopers < ActiveRecord::Migration
  def change
    create_table :developers do |t|
      t.string :nit
      t.string :name
      t.string :address
      t.string :phone
      t.string :web
      t.string :email
      t.text :comment

      t.timestamps
    end
  end
end
