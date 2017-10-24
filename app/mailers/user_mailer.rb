class UserMailer < ApplicationMailer
  def new_post(user, post)
    @post = post

    reply_to = "<#{post.id}@reply.domain.com>"
    headers "In-Reply-To" => reply_to, "References" => reply_to

    mail(
      to: "#{user.name} <#{user.email}>",
      from: "#{post.user.name} <notifications@domain.com>",
      reply_to: "#{post.user.name} #{reply_to}",
      subject: post.forum_thread.subject
    )
  end
end
