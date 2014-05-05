class Issue < ActiveRecord::Base

	belongs_to :magazine
	has_many :orders
	simple_roles
end
