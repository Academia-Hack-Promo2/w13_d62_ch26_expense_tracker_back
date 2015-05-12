class Transaction < ActiveRecord::Base

	validates :date, presence: true
	validates :t_type, presence: true, length: {maximum: 1}, :numericality => { :only_integer => true, :greater_than => 0 } 
	validates :amount, presence: true, length: {maximum: 11}, 
				:format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }, 
				:numericality => {:greater_than => 0 }
	validates :description, presence: true, length: {maximum: 50}

end
