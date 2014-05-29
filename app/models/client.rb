class Client < ActiveRecord::Base

	has_many :orders

	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

	validates :title, :presence => true,
  					  :length => { :within => 1..255 }
  	validates :reg_number, :presence => true,
  					       :length => { :within => 9..11 },
  					  	   :uniqueness => true,
  					       numericality: true
  	validates :phone, 	numericality: true,
  						:presence => true,
  						:length => { :within => 2..8 }
  	validates :contact, :presence => true,
  						:length => { :within => 3..255}					
  	validates :email, :presence => true,
  					  :length => { :within => 4..254 },
  					  :format => { :with => EMAIL_REGEX, :message => " is not in format a@b.cc"},
  					  :uniqueness => true					

end
