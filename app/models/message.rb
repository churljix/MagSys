class Message < ActiveRecord::Base

	belongs_to :user
	simple_roles


	validates :text, :presence => true,
					  :length => { :within => 1..1000 }
	validates :user_id, :presence => true,
  					  numericality: true
  	validates :recipient_id, :presence => true,
  					       numericality: true

end
