# Preview all emails at http://localhost:3000/rails/mailers/crm_mailer
class CrmMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/crm_mailer/send_contact_mail
  def send_contact_mail
    CrmMailer.send_contact_mail
  end

end
