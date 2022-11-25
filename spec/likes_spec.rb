require 'rails_helper'

RSpec.describe Like, type: :model do
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

  context 'testing method for Like model' do
    it 'should check for likes counter increased by 1' do
      Like.create(post: @post, author: @user)
      Like.create(post: @post, author: @user)

      to_check = @post.likes_counter
      expect(to_check).to eq 5
    end
  end
end
