class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :client_id
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
