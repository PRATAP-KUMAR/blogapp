class Post < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :user
  after_save :update_posts_counter

  def update_posts_counter
    user.increment!(:posts_counter)
  end

  def most_recent_comments
    comments.order('created_at desc').limit(5)
  end
end
