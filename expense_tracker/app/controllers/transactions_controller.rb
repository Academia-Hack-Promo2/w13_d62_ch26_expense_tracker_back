class TransactionsController < ApplicationController
  def create
  	transaction = Transaction.new(permit)
		if transaction.valid? 
			transaction.save
			render json: transaction
		else
			render json: transaction.errors.messages
		end
  end

  def index
    transactions = Transaction.fechas(params[:fecha_ini],params[:fecha_fin])
    render json: transactions    
  end
  
# def update
#   		transaction = Transaction.exists?(params[:id])
#   		if transaction 
#   			o = Transaction.update (params[:id]t)
#   			render json: o
#   		else
#   			render json: transaction.errors.messages
#   		end
#   end

  def destroy
    valid =  Transaction.exists?((params[:id].to_i))
	if valid
		transaction = Transaction.find((params[:id].to_i))
		transaction.delete
		render json: transaction.to_json
	else
		render json: transaction.errors.messages
	end
  end

  private

	def permit
		params.permit(:date, :t_type, :amount, :description)
	end	
end
