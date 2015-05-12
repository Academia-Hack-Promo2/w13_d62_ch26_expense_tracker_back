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

  private

	def permit
		params.permit(:date, :t_type, :amount, :description)
	end	
end
