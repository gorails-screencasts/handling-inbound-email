class EmailProcessor
  def initialize(email)
    @email = email
  end

  def process
    user = User.find_by(email: @email.from[:email])
    return unless user.present?

    id = @email.to.find{ |e| e[:host] == "reply.domain.com" }[:token]
    post = Post.find(id)
    forum_thread = post.forum_thread

    forum_thread.posts.create(
      user: user,
      body: @email.body
    )
  end
end
