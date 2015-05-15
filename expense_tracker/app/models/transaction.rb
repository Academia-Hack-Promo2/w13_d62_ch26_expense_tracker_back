class Transaction < ActiveRecord::Base

	TYPE = { ingreso: 1, egreso: 2}

	validates :date, presence: true
	validates :t_type, presence: true, length: {maximum: 1}, :numericality => { :only_integer => true, :greater_than => 0 } 
	validates :amount, presence: true, length: {maximum: 11}, :numericality => {:greater_than => 0 }
	validates :description, presence: true, length: {maximum: 50}

	belongs_to :category

	def self.fechas (fecha_ini, fecha_fin)
		Transaction.where("date>=? and date <=?", fecha_ini, fecha_fin)  	
	end

	def self.type (var)
		var = TYPE[var.to_sym] 
		var
	end	

	def self.report

		Transaction.group("category_id").sum("amount")

	end

	# def self.category (fecha_ini, fecha_fin)
	# 	Transaction.where("category_id=?",category_id)  	
	# end

end
