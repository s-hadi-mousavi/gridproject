class Developer < ActiveRecord::Base
  attr_accessible :address, :comment, :email, :name, :nit, :phone, :web
  has_many :assignments
  has_many :tasks, :through => :assignments

end
