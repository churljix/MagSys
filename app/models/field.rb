class Field < ActiveRecord::Base

	belongs_to :magazine
	has_many :orders
	simple_roles

	validates :title, :presence => true,
  					  :length => { :within => 1..255 }
  	validates :magazine_id, :presence => true,
  					        numericality: true
  	validates :height, 	numericality: true,
  						:presence => true,
  						:inclusion => { :in => 1..30 }
  	validates :width, :presence => true,
  						numericality: true,
  						:inclusion => { :in => 1..50}					
  	validates :price, :presence => true,
  					  numericality: true	
	
end
