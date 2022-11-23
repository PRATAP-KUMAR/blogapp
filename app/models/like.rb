class Like < ApplicationRecord
  belongs_to :posts
  belongs_to :author, class_name: 'User'
end
