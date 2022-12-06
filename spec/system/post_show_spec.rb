require 'rails_helper'

RSpec.describe 'User post index page', type: :system do
  subject do
    @user = User.new(
      name: 'some',
      posts_counter: 0,
      bio: 'some bio',
      photo: 'https://images.unsplash.com/photo-1601315488950-3b5047998b38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'
    )

    @post1 = Post.create(
      author: @user,
      title: 'Earthquake',
      text: 'Its a text like lorem ipsum but for capybara',
      comments_counter: 0,
      likes_counter: 0
    )

    @post2 = Post.create(
      author: @user,
      title: 'EarthCake',
      text: 'Its a text like lorem ipsum but for capybara',
      comments_counter: 0,
      likes_counter: 0
    )

    @post3 = Post.create(
      author: @user, title: 'EarthQuack',
      text: 'Its a text like lorem ipsum but for capybara',
      comments_counter: 0, likes_counter: 0
    )

    @comment = Comment.create(
      post: @post1,
      author: @user,
      text: 'lets comment for capybara testing'
    )
  end

  before { subject.save }

  describe 'testing for post show page', js: true do
    it 'I can see the posts title' do
      visit user_post_path('1', '1')
      page.has_content?(@post1.title)
    end

    it 'I can see who wrote the post' do
      visit user_post_path('1', '1')
      page.has_content?(@post1.author.name)
    end

    it 'I can see howmany comments it has' do
      visit user_post_path('1', '1')
      sleep(10)
      page.has_content?("Comments: #{@post1.comments_counter}")
    end

    it 'I can see howmany Likes it has' do
      visit user_post_path('1', '1')
      page.has_content?("Likes: #{@post1.likes_counter}")
    end

    it 'I can see the post body' do
      visit user_post_path('1', '1')
      page.has_content?(@post1.text)
    end

    it 'I can see the username of each commentor' do
      visit user_post_path('1', '1')
      page.has_content?(@comment.author.name)
    end

    it 'I can see the comment each commentor left' do
      visit user_post_path('1', '1')
      page.has_content?(@comment.text)
    end
  end
end
