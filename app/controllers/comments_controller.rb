class CommentsController < ApplicationController
  before_action :get_user, only: %i[new create update]
  before_action :get_product, only: %i[create edit update destroy]
  before_action :get_comment, only: %i[edit update destroy]

  def create
    @comment = @product.comments.create(comment_params)
    flash[:errors] = @comment.errors.full_messages unless @comment.valid?
    redirect_to @product
  end

  def edit; end

  def update
    if @comment.update(comment_params)
      redirect_to @product
    else
      render 'edit'
    end
  end

  def destroy
    @comment.destroy
    redirect_to @product
  end

  private

  def get_comment
    @comment = Comment.find(params[:id])
  end

  def get_product
    @product = Product.find(params[:product_id])
  end

  def get_user
    @user = current_user if user_signed_in?
  end

  def comment_params
    params.require(:comment).permit(:rating, :body, :product_id).merge(user_id: @user.id)
  end
end
