class UserMailer < ApplicationMailer
  default from: 'matsakovamira156@gmail.com'

  def order_summary
    @order = params[:order]
    mail(to: @order.email, subject: 'Shopping in the apple store')
  end
end
