class Invoice < ActiveRecord::Base

	has_many :payments
	belongs_to :contract

end
