class UserMailer < ApplicationMailer
	default from: 'matsakovamira156@gmail.com'

	def order_summary
    @user = params[:user]
    @order = params[:order]
    mail(to: @user.email, subject: 'Shopping in the apple store')
  end
end
