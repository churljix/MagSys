class Issue < ActiveRecord::Base

	belongs_to :magazine
	has_many :orders
	simple_roles

  def number_and_magazine_id
    @magazine = Magazine.find(magazine_id)
    number.to_s + '# ' + @magazine.title
  end

	validates :magazine_id, :presence => true,
  					  numericality: true
  	validates :number, :presence => true,
  					       :inclusion => 1..365
  	validates :date, 	:presence => true				
  	validates :due_date, 	:presence => true
    validates_date :due_date, :after => :date
  	validates :status, :presence => true,
  					   :inclusion => { :in =>  %w(Y N) }		
end
