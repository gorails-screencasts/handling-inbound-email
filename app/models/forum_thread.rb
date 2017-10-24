class ForumThread < ApplicationRecord
  belongs_to :user
  has_many :posts
  has_many :users, through: :posts
end
