class Weeklystatus < ActionMailer::Base

  default from: "jfalkson@gmail.com"

##Add arguments so that we can pass this data from the controller to this
## action mailer model 
  def weekly_email(user)
  	##Set variables to be called in email 
    @user = user
    @url  = 'http://example.com/login'
    mail(to: "jfalkson@gmail.com", subject: 'Welcome to My Awesome Site')
  end

end
