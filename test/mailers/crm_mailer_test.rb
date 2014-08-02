require 'test_helper'

class CrmMailerTest < ActionMailer::TestCase
  test "send_contact_mail" do
    mail = CrmMailer.send_contact_mail
    assert_equal "Send contact mail", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
