class ProductsController < ApplicationController

	def index 
		@products = Product.paginate(page: params[:page], per_page: 6)
		@parameter = params[:category]
    if @parameter.present?
      @products = Product.all.where(category_id: @parameter).paginate(page: params[:page], per_page: 6)

    end
	end 

end
