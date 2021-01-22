class Cart < ApplicationRecord
  belongs_to :user, optional: true
  has_many :cart_items, dependent: :destroy
  has_one :order, dependent: :destroy

  enum status: [:in_progress, :completed]

  def add_product(product)
  	current_item = cart_items.find_by(product_id: product.id)

  	if current_item 
  		current_item.increment(:quantity)
  	else 
  		current_item = cart_items.build(product_id: product.id)
  	end 
  	current_item 
  end 

  def remove_quantity
  	current_item = cart_items.find_by(product_id: product.id)
  	current_item.decrement(:quantity)
  end 

  def total_price
    cart_items.to_a.sum { |item| item.total_price}
  end

end

# == Schema Information
#
# Table name: carts
#
#  id         :bigint           not null, primary key
#  user_id    :bigint
#  status     :integer          default("in_progress")
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
