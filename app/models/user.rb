class User < ActiveRecord::Base

	has_many :messages
	belongs_to :agency
	has_many :orders

end
