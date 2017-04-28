class UserMailer < ApplicationMailer
  default from: "buddy@karma.com"

  def order_placed_email(user)
  	@user = user
  	# @url = 'http://google.com'
  	mail(to: "timmylimy04@gmail.com", subject: "Order From Someone")
  end
end
