 class Contactus< ActionMailer::Base

  def contact_notification(sender)
    @sender = sender
    mail(:to => "jfalkson@gmail.com",
         :from => sender.email,
         :subject => "New #{sender.support_type}")
 end

end