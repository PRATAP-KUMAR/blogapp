class Like < ApplicationRecord
  belongs_to :post
  belongs_to :user
  after_save :update_likes_counter

  def update_likes_counter
    post.increment!(:likes_counter)
  end
end
