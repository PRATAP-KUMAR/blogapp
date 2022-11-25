class Post < ApplicationRecord
    has_many :likes, dependent: :destroy
    has_many :comments, dependent: :destroy
    belongs_to :author, class_name: 'User'
    after_save :update_posts_counter
    
    def most_recent_comments
      comments.order('created_at desc').limit(5)
    end

    private
    def update_posts_counter
      author.increment!(:posts_counter)
    end
end
