class Task < ActiveRecord::Base
  attr_accessible :description, :name, :sprint_id, :developer_ids,:stimated_time,:deliver_time,:status
  belongs_to :sprint
  has_many :assignments
  has_many :developers, :through => :assignments
end
