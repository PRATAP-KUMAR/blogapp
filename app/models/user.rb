class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  def most_recent_3_posts
    posts.order('created_at desc').limit(3)
  end
end
