class Payment < ActiveRecord::Base

	belongs_to :invoice

	validates :invoice_id, :presence => true,
  					  numericality: true
  	validates :amount, :presence => true,
  					       numericality: true
  	# validates :date, 	:presence => true,
  	# 					date: true,
  	# 					date: { before: Time.now }

end
