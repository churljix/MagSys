class Invoice < ActiveRecord::Base

	has_many :payments
	belongs_to :contract


	   validates :total, :presence => true,
                   :numericality => { :greater_than_or_equal_to => 0 }
  	# validates :remaining, :presence => true,
  	# 				       numericality: true
  	validates :date, 	:presence => true
  	validates :due_date, 	:presence => true
    validates_date :due_date, :after => :date
  	validates :contract_id, :presence => true,
  							numericality: true					
  	validates_length_of  :note, :maximum => 500		
end
