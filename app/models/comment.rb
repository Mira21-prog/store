class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :body, presence: true
  validates :rating, presence: true
  validates_uniqueness_of :user_id, { scope: :product_id, message: "has already left a comment for this product" }

end
