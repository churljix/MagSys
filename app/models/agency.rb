class Agency < ActiveRecord::Base

	has_many :contracts
	has_many :users

	validates :title, :presence => true,
  						:length => { :within => 1..250 }
  	validates :reg_number, :presence => true,
  					  :length => { :within => 9..11 },
  					  :uniqueness => true,
  					  numericality: true
  	validates :address,  :length => { :within => 10..200 },
  						 :presence => true
  	validates :phone, 	numericality: true,
          						  :presence => true,
          						  :length => { :within => 2..8 }
  						
end
