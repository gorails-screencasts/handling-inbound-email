class Post < ApplicationRecord
  belongs_to :forum_thread
  belongs_to :user

  def send_notifications!
    (forum_thread.users.uniq - [user]).each do |user|
      UserMailer.new_post(user, self).deliver_now
    end
  end
end
