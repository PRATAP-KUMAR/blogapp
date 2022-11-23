class Like < ApplicationRecord
    has_many: comments, likes
    belongs_to: user
end
