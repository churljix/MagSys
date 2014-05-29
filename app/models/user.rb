class User < ActiveRecord::Base

	has_secure_password

	has_many :messages
	belongs_to :agency
	has_many :orders
  has_many :contracts

  	simple_roles

  	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i
  	PASSWORD_REGEX= /(?=.*[a-zA-Z])(?=.*[0-9]).{6,}/

  	validates :username, :presence => true,
  						 :length => { :within => 3..20 },
  						 :uniqueness => true
  	validates :email, :presence => true,
  					  :length => { :within => 4..254 },
  					  :format => { :with => EMAIL_REGEX, :message => " is not in format a@b.cc"},
  					  :uniqueness => true
    validates :agency_id, :presence => true
  	validates :password, #:confirmation => true,
  						 :length => { :within => 6..20 },
  						 :format => { :with => PASSWORD_REGEX, :message => " has to contain 6 symbols and one of which has to be a number"} , 
  						 :presence => true,		on: :create			 

end
