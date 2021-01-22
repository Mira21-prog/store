class CartItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product

  def total_price
    product.price.to_i * quantity.to_i
  end
end

# == Schema Information
#
# Table name: cart_items
#
#  id         :bigint           not null, primary key
#  cart_id    :bigint           not null
#  product_id :bigint           not null
#  quantity   :integer          default(1)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
