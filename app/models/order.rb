class Order < ActiveRecord::Base

	belongs_to :issue
	belongs_to :field
	belongs_to :client
	belongs_to :contract
	belongs_to :user

end
