class CategoriesController < ApplicationController

  def create
  	categories = Category.new(permit)
  		if categories.valid?
  			categories.save
  			render json: categories
  		else
  			render json: categories.errors
  		end
  end

  def update

  	exist = Category.exists?(params[:id].to_i)
  	if exist
  		objeto = Category.update(params[:id],permit)
  		render json: objeto
  	else
  		render json:  {"error"=> "La categoria no existe"}
  	end
  end

  def destroy
    exist = Category.exists?(params[:id])
    if exist
      objeto = Category.destroy(params[:id])
      render json: {"mensaje"=> "Categoria borrada"}
    else
      render json: {"Error" => "La categoria no existe"}
    end
  end

  def transactions_categorys
    category = Category.find(params[:category_id])
    render json: {category: category, transactions: category.transactions.fechas(params[:fecha_ini],params[:fecha_fin])}
  end

  def categorys_all_transactions
    categorias = categorias_transactions = Category.includes(:transactions)
    render json: categorias, include: :transactions
  end

  def index
    objeto = Category.all
    render json: objeto  
  end
  
  private
  
  def permit
		params.permit(:category_title)
  end
end
