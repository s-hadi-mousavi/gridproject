class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :task_id
      t.integer :developer_id
      t.integer :estimated_time
      t.integer :accomplished_time
      t.integer :status

      t.timestamps
    end
  end
end
