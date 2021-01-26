class CommentsController < ApplicationController
	before_action :get_user, only: [:new, :create]
 
	def create 
		@product = Product.find(params[:product_id])
    @comment = @product.comments.create(comment_params)
	end 

	private 

	def get_user
		@user = current_user if user_signed_in?
	end

	def comment_params
		params.require(:comment).permit(:rating, :body, :product_id).merge(user_id: @user.id)
	end
end
