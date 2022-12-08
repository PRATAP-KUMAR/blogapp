class Post < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  belongs_to :author, class_name: 'User'
  after_save :update_posts_counter

  validates :title, presence: true, length: {
    maximum: 250,
    too_long: '%<count>s characters is the maximum allowed'
  }

  validates :comments_counter, presence: true,
                               numericality: {
                                 only_integer: true,
                                 greater_than_or_equal_to: 0
                               }

  validates :likes_counter, presence: true,
                            numericality: {
                              only_integer: true,
                              greater_than_or_equal_to: 0
                            }

  def most_recent_comments
    comments.order('created_at desc').limit(5)
  end

  def update_posts_counter_when_deleted
    author.decrement!(:posts_counter)
  end

  private

  def update_posts_counter
    author.increment!(:posts_counter)
  end
end
