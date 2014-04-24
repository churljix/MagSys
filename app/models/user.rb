class User < ActiveRecord::Base

	has_secure_password

	has_many :messages
	belongs_to :agency
	has_many :orders

  	simple_roles

end
