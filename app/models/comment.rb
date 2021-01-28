class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :body, presence: true
  validates :rating, presence: true
  validates_uniqueness_of :user_id, { scope: :product_id, message: "should happen once per year" }

end
