class ContactMailer < ApplicationMailer
  def contact_mail(contact)
    @contact = contact
    mail to:"smb50stretch@gmail.com",subject: "confirmation"
  end
end
