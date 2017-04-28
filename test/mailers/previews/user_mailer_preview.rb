# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
	def order_placed_email_preview
		UserMailer.order_placed_email(User.first)
	end
end
