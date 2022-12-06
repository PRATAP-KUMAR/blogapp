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

  describe 'testing for user post index page', js: true do
    it 'I can see the users profile picture' do
      visit user_posts_path('1')
      page.has_content?('Screenshot Image')
      expect(page).to have_css('img')
    end

    it 'I can see the users username' do
      visit user_posts_path('1')
      page.has_content?(@user.name)
    end

    it 'I can see the number of posts the user has written' do
      page.has_content?("number of posts: #{@user.posts_counter}")
    end

    it 'I can see a posts title' do
      page.has_content?(@post1.title.to_s)
    end

    it 'I can see some of the posts body' do
      page.has_content?(@post1.text.to_s)
    end

    it 'I can see how many comments a post has' do
      visit user_posts_path('1')
      page.has_content?("comments: #{@post1.comments_counter}")
    end

    it 'I can see how many likes a post has' do
      visit user_posts_path('1')
      page.has_content?("likes: #{@post1.likes_counter}")
    end

    # it 'I can see a section for pagination if there are more posts than fit on the view' do
    #   expect(2).to eq 2
    # end

    it 'When I click on a post, it redirects me to that posts show page' do
      visit user_posts_path('1')
      click_on('Post #1')
      expect(page).to have_current_path('/users/1/posts/1')
    end
  end
end
