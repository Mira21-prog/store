class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product

  def coment_exist
  end 
end
