class CrmMailer < ActionMailer::Base
  default from: "scott.mcquin@incomdirect.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.crm_mailer.send_contact_mail.subject
  #
  def send_contact_mail(conatct_email_object)
    c= Contact.select("email,name").find(conatct_email_object.contact_id)

    @greeting = "Hi #{c.name}"
    @message = conatct_email_object.message

    mail to: "#{c.email}",subject:conatct_email_object.subject
  end
end
