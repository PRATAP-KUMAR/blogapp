require 'rails_helper'

RSpec.describe Comment, type: :model do
  before(:each) do
    @user = User.create(name: 'Test User',
                        photo: 'test photo link',
                        bio: 'Testing Tool',
                        posts_counter: 18)
    @post = Post.create(author: @user,
                        title: 'Hello',
                        text: 'Some text',
                        comments_counter: 2,
                        likes_counter: 3)
  end

  context 'testing method for Comment model' do
    it 'should check for comments counter increased by 1' do
      comment = Comment.create(post: @post,
                               author: @user,
                               text: 'This is my first comment')
      to_check = comment.post.comments_counter
      expect(to_check).not_to be 4
    end
  end
end
