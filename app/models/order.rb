class Order < ActiveRecord::Base

	belongs_to :issue
	belongs_to :field
	belongs_to :client
	belongs_to :contract
	belongs_to :user

	  validates :issue_id, :presence => true
  	validates :field_id, :presence => true 	
    validates :user_id, :presence => true
  	validates_length_of  :notes, :maximum => 500, :allow_blank => true				  				  
    validates_length_of  :title, :maximum => 100, :allow_blank => true
  	validates :total_amount, :presence => true, :numericality => { :greater_than_or_equal_to => 0 }
  	validates :status, :presence => true,
  					   :inclusion => { :in =>  %w(D P S A) } #deleted, pending, sent, accepted
end
