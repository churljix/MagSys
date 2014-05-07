class Message < ActiveRecord::Base

	belongs_to :user


	validates :text, :presence => true,
					  :length => { :within => 1..1000 }
	validates :sender_id, :presence => true,
  					  numericality: true
  	validates :recipient_id, :presence => true,
  					       numericality: true

end
