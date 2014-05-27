class Payment < ActiveRecord::Base

	belongs_to :invoice

	validates :invoice_id, :presence => true,
  					  numericality: true
  	validates :amount, :presence => true,
  					       :numericality => { :greater_than_or_equal_to => 0 }
  	validates :date, 	:presence => true
  	validates_date :date,	:on_or_after => :today

end
