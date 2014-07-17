class Contact < ActiveRecord::Base
  attr_accessible :cellphone, :client_id, :comment, :email, :name, :phone
  belongs_to :clients
end
