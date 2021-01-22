module ApplicationHelper
  def resource_name
    :user
  end

  def resource
    @user ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def cart
    Cart.find_by(id: cookies[:cart_id])
  end

  def cart_url
    return cart_path(cart) if cart.present?

    '#'
  end
end
