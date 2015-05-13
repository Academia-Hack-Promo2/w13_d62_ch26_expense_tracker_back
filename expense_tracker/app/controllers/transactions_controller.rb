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

  def update
  		transaction = Transaction.exists?(params[:id].to_i)
  		if transaction 
  			o = Transaction.update (params[:id],permit)
  			render json: o
  		else
  			render json: transaction.errors.messages
  		end
  end


    def destroy
    transaction = Transaction.exists?(params[:id])
    if exist
      o = Transaction.destroy(params[:id])
      render json: {"mensaje"=> "Transaccion eliminada"}
    else
      render json: {"Error" => "La transaccion no existe"}
    end
  end

  private

	def permit
		params.permit(:date, :t_type, :amount, :description)
	end	
end
