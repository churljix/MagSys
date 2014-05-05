class Magazine < ActiveRecord::Base

	has_many :issues
	has_many :fields
	simple_roles
	
end
