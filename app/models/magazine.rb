class Magazine < ActiveRecord::Base

	has_many :issues, :dependent => :destroy
	has_many :fields, :dependent => :destroy
	simple_roles

  mount_uploader :picture, PictureUploader

	validates :title, :presence => true,
					  :length => { :within => 1..255 }
	validates :issue, :presence => true,
  					  numericality: true
  	validates :prints, :presence => true,
  					       numericality: true
  	validates :subscribers, :presence => true,
  					  numericality: true
  	validates :readership, :presence => true,
  					  numericality: true				  				       
  	#validates :picture				  
  	validates :status, :presence => true,
  					   :inclusion => { :in =>  %w(Y N) }
	
end
