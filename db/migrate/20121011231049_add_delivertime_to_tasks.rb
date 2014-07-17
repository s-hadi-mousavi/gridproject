class AddDelivertimeToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :deliver_time, :integer
  end
end
