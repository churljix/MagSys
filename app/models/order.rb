class Order < ActiveRecord::Base

	belongs_to :issue
	belongs_to :field
	belongs_to :client
	belongs_to :contract
	belongs_to :user

	validates :issue_id, :presence => true
  	validates :field_id, :presence => true			  
  	#validates :client_id #:presence => true  	validates :user_id, :presence => true,
  	#validates :contract_id
  	#validates :notes, :length => { :within => 0..500 } 				  				  

  	#validates :total_amount #:presence => true,
  	#validates :remaining #:presence => true,
  	#validates :special
  	#validates :picture				  
  	validates :status, :presence => true,
  					   :inclusion => { :in =>  %w(P S A) }
end
