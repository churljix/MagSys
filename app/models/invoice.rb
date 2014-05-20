class Invoice < ActiveRecord::Base

	has_many :payments
	belongs_to :contract


	validates :total, :presence => true,
  					  numericality: true
  	validates :remaining, :presence => true,
  					       numericality: true
  	validates :date, 	:presence => true,
  						date: true,
  						date: { before: :due_date }
  	validates :due_date, 	:presence => true,
  							date: true,
  							date: { after: :date }
  	validates :contract_id, :presence => true,
  							numericality: true					
  	#validates :note, :lenght => { :within => 0..500 }		
end
