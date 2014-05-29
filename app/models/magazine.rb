class Magazine < ActiveRecord::Base

	has_many :issues, :dependent => :destroy
	has_many :fields, :dependent => :destroy
	simple_roles

  mount_uploader :picture, PictureUploader

  	validates :title, :presence => true,
  					  :length => { :within => 1..255 }
  	validates :issue, :presence => true,
    					  :inclusion => { :in => 1..365, :message => " has to be between 1 and 365"}
  	validates :prints, 
  					       :inclusion => { :in => 1..999999, :message => " has to be between 1 and 999999"}
  	validates :subscribers, 
  					  :inclusion => { :in => 1..999999, :message => " has to be between 1 and 999999"}
  	validates :readership, 
  					  :inclusion => { :in => 1..999999, :message => " has to be between 1 and 999999"}				  				       

  	validates :status, :presence => true,
  					   :inclusion => { :in =>  %w(Y N) }
	
end
