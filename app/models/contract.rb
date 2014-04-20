class Contract < ActiveRecord::Base

	has_many :invoices
	has_many :orders
	belongs_to :agency

end
