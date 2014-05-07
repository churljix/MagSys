class Order < ActiveRecord::Base

	belongs_to :issue
	belongs_to :field
	belongs_to :client
	belongs_to :contract
	belongs_to :user

	validates :title, :presence => true,
					  :length => { :within => 1..255 }
	validates :issue_id, :presence => true,
  					  numericality: true
  	validates :field_id, :presence => true,
  					  numericality: true				  
  	validates :client_id, :presence => true,
  					  numericality: true
  	validates :user_id, :presence => true,
  					  numericality: true
  	validates :contract_id, 
  					  numericality: true				  				  				  
  	validates :notes, :length => { :within => 1..500 } 				  				  

  	validates :total_amount, :presence => true,
  					       numericality: true
  	validates :remaining, :presence => true,
  					  numericality: true
  	validates :special, 
  					  numericality: true				  				       
  	#validates :picture				  
  	validates :status, :presence => true,
  					   :inclusion => { :in =>  %w(Y N) }
end
