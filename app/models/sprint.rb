class Sprint < ActiveRecord::Base
  attr_accessible :description, :name, :proyect_id
  has_many :tasks
  belongs_to :project
end
