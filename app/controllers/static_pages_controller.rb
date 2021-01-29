class StaticPagesController < ApplicationController
  def about; end

  def profile
    current_user if user_signed_in?
  end
end
