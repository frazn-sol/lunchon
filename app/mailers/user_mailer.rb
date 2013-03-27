class UserMailer < ActionMailer::Base
  default from: "info@lunchon.co"

  def purchase_email(user, purchase)
    @user = user
    @purchase = purchase
    mail(to: user.email, subject: 'Your Lunchon.co Purchase')
  end
end
