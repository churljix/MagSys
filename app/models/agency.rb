class Agency < ActiveRecord::Base

	has_many :contracts
	has_many :users

end
