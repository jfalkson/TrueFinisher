class Weeklystatus < ActionMailer::Base

  default from: "jfalkson@gmail.com"

  def weekly_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: "jfalkson@gmail.com", subject: 'Welcome to My Awesome Site')
  end

end
