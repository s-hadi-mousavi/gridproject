class CreateDevelopersTasksJoin < ActiveRecord::Migration
   def self.up
     create_table 'developers_tasks', :id => false do |t|
       t.column :developer_id, :integer
       t.column :task_id, :integer
     end
   end

  def down
     drop_table 'developers_tasks'
  end
end
