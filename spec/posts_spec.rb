require 'rails_helper'

lorem_ipsum = 'lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum
lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem
ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum loremlorem ipsum lorem ipsum lorem ipsum lorem ipsum
lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum'

RSpec.describe Post, type: :model do
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

  context 'testing validation for Post model' do
    it 'should validate post cant be empty' do
      @post.title = lorem_ipsum
      expect(subject).to_not be_valid
    end
  end

  context 'testing method for Post model' do
    it 'should have a title text = Changed Title' do
      @post.title = 'Changed Title'
      expect(@post.title).to eq('Changed Title')
    end
  end

  context 'testing method for Post model' do
    it 'should have a comments_counter = 8' do
      @post.comments_counter = 8
      expect(@post.comments_counter).to be 8
    end
  end
end
