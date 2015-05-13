class Transaction < ActiveRecord::Base

	validates :date, presence: true
	validates :t_type, presence: true, length: {maximum: 1}, :numericality => { :only_integer => true, :greater_than => 0 } 
	validates :amount, presence: true, length: {maximum: 11}, :numericality => {:greater_than => 0 }
	validates :description, presence: true, length: {maximum: 50}
  belongs_to :category

  def self.fechas (fecha_ini, fecha_fin)
  	Transaction.where("date>=? and date <=?", fecha_ini, fecha_fin)  	
  end

end
