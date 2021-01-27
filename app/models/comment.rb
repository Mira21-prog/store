class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :body, presence: true
  validates :rating, presence: true
end
