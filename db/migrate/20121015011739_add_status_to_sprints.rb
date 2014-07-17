class AddStatusToSprints < ActiveRecord::Migration
  def change
    add_column :sprints, :status, :integer
  end
end
