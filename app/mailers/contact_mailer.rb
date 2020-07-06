class ContactMailer < ApplicationMailer
  default from: 'system@ajakus.com'
  layout "mailer"

  def email_for_new_contact(contact_id)
    @contact = Contact.find_by(id: contact_id)
    return unless @contact
    subject = "New Contact Received"
    mail(
      to: "info@ajakus.com",
      subject: subject
    ) do |format| 
      format.html { render "email_for_new_contact", :layout => false }
    end
  end
end
