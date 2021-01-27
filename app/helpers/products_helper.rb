module ProductsHelper
	def check_product(product)
		Product.joins(cart_items: { cart: :order }).where(orders: { user_id: current_user.id }).exists?(id: product.id)
	end
	def check_exist_comment
	  Comment.joins(:user).exists?(user_id: current_user.id)
	end
end
