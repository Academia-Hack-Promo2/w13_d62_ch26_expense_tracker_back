class TransactionsController < ApplicationController

  def index
    transaction = Transaction.fechas(params[:fecha_ini],params[:fecha_fin])
    render json: transaction
  end

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
   transaction = Transaction.update(params[:id],permit)
   render json: transaction
 else
   render json: transaction.errors.messages
 end
end

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

def report
    transaction = Transaction.report(params[:month])
    render json: transaction
end

private


def permit
  params[:t_type] = Transaction.type(params[:t_type])
  params.permit(:date, :t_type, :amount, :description, :category_id)
end

end
