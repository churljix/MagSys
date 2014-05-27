class Magazine < ActiveRecord::Base

	has_many :issues, :dependent => :destroy
	has_many :fields, :dependent => :destroy
	simple_roles

  mount_uploader :picture, PictureUploader

  	validates :title, :presence => true,
  					  :length => { :within => 1..255 }
  	validates :issue, :presence => true,
    					  :inclusion => 1..365
  	validates :prints, 
  					       :inclusion => 1..100000
  	validates :subscribers, 
  					  :inclusion => 1..100000
  	validates :readership, 
  					  :inclusion => 1..100000				  				       

  	validates :status, :presence => true,
  					   :inclusion => { :in =>  %w(Y N) }
	
end
