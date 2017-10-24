class UserMailer < ApplicationMailer
  def new_post(user, post)
    @greeting = "Hi"

    mail(
      to: "#{user.name} <#{user.email}>",
      from: "#{post.user.name} <notifications@domain.com>",
      subject: post.forum_thread.subject
    )
  end
end
