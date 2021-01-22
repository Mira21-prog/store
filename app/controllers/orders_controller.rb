class OrdersController < ApplicationController
	before_action :get_cart
	before_action :get_current_user, only: [:create]

	def new
		@order = Order.new
	end 

	def create
		@cart.create_order(permit_params)
		@cart.completed!
		cookies.delete(:cart_id)
	  redirect_to root_path
	end

	private

	def get_cart
		@cart = Cart.find(cookies[:cart_id])
	end

	def get_current_user 
		current_user
	end 

	def permit_params
		params.require(:order).permit(:city, :address).merge(user_id: current_user.id)
	end 
end
