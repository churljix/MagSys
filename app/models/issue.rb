class Issue < ActiveRecord::Base

	belongs_to :magazine
	has_many :orders, :dependent => :destroy
	simple_roles

	validates :magazine_id, :presence => true,
  					  numericality: true
  	validates :number, :presence => true,
  					       numericality: true
  	validates :date, 	:presence => true,
  						date: true,
  						date: { before: :due_date }
  	validates :due_date, 	:presence => true,
  							date: true,
  							date: { after: :date }
  	validates :status, :presence => true,
  					   :inclusion => { :in =>  %w(Y N) }		
end
