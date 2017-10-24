require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "new_post" do
    mail = UserMailer.new_post
    assert_equal "New post", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
