class Order < ApplicationRecord
  belongs_to :user
  belongs_to :cart
  validates :name, :email, :city, :address, presence: true
end

# == Schema Information
#
# Table name: orders
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  cart_id    :bigint           not null
#  address    :string
#  city       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
