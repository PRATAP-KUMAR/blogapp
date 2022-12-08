class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User'
  after_save :update_comments_counter

  def update_comments_counter_when_deleted
    post.decrement!(:comments_counter)
  end

  private

  def update_comments_counter
    post.increment!(:comments_counter)
  end
end
