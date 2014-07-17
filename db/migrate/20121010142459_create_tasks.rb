class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :sprint_id
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
