class AddStimatedtimeToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :stimated_time, :integer
  end
end
