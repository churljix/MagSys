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
  					  :format => { :with => EMAIL_REGEX, :message => " is not in format a@b.c"},
  					  :uniqueness => true
  	validates :password, :confirmation => true,
  						 :length => { :within => 6..20 },
  						 :format => PASSWORD_REGEX,
  						 :presence => true					 

end
