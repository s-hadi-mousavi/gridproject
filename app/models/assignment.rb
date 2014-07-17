class Assignment < ActiveRecord::Base
  attr_accessible :accomplished_time, :developer_id, :estimated_time, :status, :task_id
  belongs_to :task
  belongs_to :developer
end
