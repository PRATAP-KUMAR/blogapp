class Comment < ApplicationRecord
  belongs_to :posts, class_name: 'Post'
  belongs_to :author, class_name: 'User'
end
