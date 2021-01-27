class CommentsController < ApplicationController
	before_action :get_user, only: [:new, :create, :update]
 
	def create
		@product = Product.find(params[:product_id])
    @comment = @product.comments.create(comment_params)
    redirect_to @product
	end 

	def edit
		@product = Product.find(params[:product_id])
		@comment = Comment.find(params[:id])
	end

	def update 
		@product = Product.find(params[:product_id])
		@comment = Comment.find(params[:id])
		@comment.update!(comment_params)
		redirect_to @product
	end 

	def destroy
		@product = Product.find(params[:product_id])
		@comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to @product
  end

	private 

	def get_user
	  @user = current_user if user_signed_in?
	end

	def comment_params
		params.require(:comment).permit(:rating, :body, :product_id).merge(user_id: @user.id)
	end
end
