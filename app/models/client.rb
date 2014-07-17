class Client < ActiveRecord::Base
  attr_accessible :address, :city, :comment, :email, :name, :nit, :phone, :web
  validates_uniqueness_of :nit, :message => "El Nit ya existe."
  has_many :projects
  has_many :contacts
end
