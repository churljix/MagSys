class Contract < ActiveRecord::Base

	has_many :invoices
	has_many :orders
	belongs_to :agency
	belongs_to :user

	validates :agency_id, :presence => true
	validates :date, :presence => true
	validates :discount, :presence => true,
						 :inclusion => { :in => 1..100, :message => " has to be between 1 and 100"}		,
						 numericality: true
	validates_length_of  :notes, :maximum => 500	
  	validates :user_id, :presence => true,
  					       numericality: true
end
