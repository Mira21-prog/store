class OrdersController < ApplicationController
  before_action :get_cart
  before_action :get_current_user, only: [:create]

  def new
    @order = Order.new
    if current_user.present?
      @latest_order = current_user.orders.last
    else
    end
  end

  def create
    @order = @cart.build_order(permit_params)
    if @order.save
      @cart.completed!
      cookies.delete(:cart_id)
      UserMailer.with(order: @order).order_summary.deliver_later
      redirect_to root_path
      flash[:notice] = 'Order successfully created'
    else
      render 'new'
    end
  end

  private

  def get_cart
    @cart = Cart.find(cookies[:cart_id])
  end

  def get_current_user
    @user = current_user
  end

  def permit_params
    params.require(:order).permit(:city, :address, :name, :email).merge(user_id: current_user.id)
  end
end
