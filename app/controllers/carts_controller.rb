class CartsController < ApplicationController
	before_action :get_cart

	def show 
		@cart_items = @cart.cart_items.all
	end

	def update
		if @cart.order.present?
			@cart.completed!
			@cart_items = nil
		else 
			@cart.in_progress!
		end
		redirect_to root_path
	end

	private

	def get_cart
		@cart = Cart.find(params[:id])
	end
end
