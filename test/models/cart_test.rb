require 'test_helper'

class CartTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
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
