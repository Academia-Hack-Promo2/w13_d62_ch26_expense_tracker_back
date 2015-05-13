class Transaction < ActiveRecord::Base

	validates :date, presence: true
	validates :t_type, presence: true, length: {maximum: 1}, :numericality => { :only_integer => true, :greater_than => 0 } 
	validates :amount, presence: true, length: {maximum: 11}, :numericality => {:greater_than => 0 }
	validates :description, presence: true, length: {maximum: 50}

	has_and_belongs_to_many :category

	def self.fechas (fecha_ini, fecha_fin)
		Transaction.where("date>=? and date <=?", fecha_ini, fecha_fin)  	
	end

	# def self.category (fecha_ini, fecha_fin)
	# 	Transaction.where("category_id=?",category_id)  	
	# end

end
