class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail to:"SMB@gmail.com",subject: "confirmation"
  end
end
