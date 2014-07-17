class Project < ActiveRecord::Base
  attr_accessible :client_id, :description, :name, :status
  belongs_to :client
  has_many :sprints
end
