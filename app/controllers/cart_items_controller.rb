class CartItemsController < ApplicationController
	before_action :get_cart, only: [:create, :update, :destroy]
	skip_before_action :verify_authenticity_token, only: [:update, :destroy]
	before_action :total_price, only: [:update]
	before_action :find_cart_items, only: [:update, :destroy]

	def index
		@items = CartItems.all
	end 

	def new
		@product_item = Product.new
	end

	def create
		@product = Product.find(params[:product_id])
		@product_item = @cart.add_product(@product)
		if @product_item.save
     redirect_to root_path
    else
    	render 'new'
    end
	end

	def update
		quantity = params[:query]
		check_increment(quantity)
		respond_to do |format|
			format.json do
				render json: {quantity_count: @quantity_count, price: @price}
			end
			format.html do
			 redirect_to cart_path(@cart)
			end
    end
	end 

	def destroy
		@item.destroy
		respond_to do |format|
			format.json do
				render json: { item: @item.id }
			end
			format.html do
			 redirect_to cart_path(@cart)
			end
		end
	end 

	private 

	def find_cart_items 
		@item = CartItem.find(params[:id])
	end 

	def check_increment(quantity)
		if quantity == "increment" 
		  @item.update(quantity: @item.quantity + 1)
			@quantity_count = @item.quantity
		else
			count = @item.quantity - 1
		  @item.update(quantity: count) unless count.negative?
		  @quantity_count = @item.quantity
		end
	end 

	def get_cart
		if cookies[:cart_id].present?
			@cart = Cart.find(cookies[:cart_id])
		else
			@cart = Cart.create
			cookies[:cart_id] = @cart.id
			@cart
		end
	end

	def total_price 
		@price = @cart.total_price
	end
end
