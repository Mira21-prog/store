class ProductsController < ApplicationController
	before_action :get_category, only: :index

	def index 
		@products = Product.searcher(params)
		respond_to do |format|
			format.html do
				@products = @products.paginate(page: params[:page], per_page: 6).order(price: :asc)
			end
			format.json do
				render json: @products
			end
		end
	end 

	def show
		@product = Product.find(params[:id].split('-').first)
	end 

	private

	def get_category
		@category = Category.find_by(id: params[:q])
	end 
end