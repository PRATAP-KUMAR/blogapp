require 'rails_helper'

RSpec.describe 'User Show Page', type: :system do
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
      author: @user,
      title: 'EarthQuack',
      text: 'Its a text like lorem ipsum but for capybara',
      comments_counter: 0,
      likes_counter: 0
    )
  end

  before { subject.save }

  describe 'Show page', js: true do
    it 'tests for I can see the users profile picture' do
      visit user_path('1')
      page.has_content?('Screenshot Image')
      expect(page).to have_css('img')
    end

    it 'tests for I can see the users user name' do
      visit user_path('1')
      page.has_content?(@user.name)
    end

    it 'tests for I can see the number of posts the user has written' do
      visit user_path('1')
      page.has_content?("number of posts: #{@user.posts_counter}")
    end

    it 'tests for I can see the users bio' do
      visit user_path('1')
      page.has_content?(@user.bio.to_s)
    end

    it 'tests for I can see the users first 3 posts' do
      visit user_path('1')
      expect(page).to have_selector("div[class='rectangle']", count: 3)
    end

    it 'tests for I can see a button that lets me view all of a users' do
      visit user_path('1')
      expect(page).to have_selector("div[class='show-all-posts']")
    end

    it 'tests for When I click a users post, it redirects me to that post' do
      visit user_path('1')
      click_on('Most recent post_1')
      expect(page).to have_current_path('/users/1/posts/3')
    end

    it 'tests for When I click a users post, it redirects me to that post' do
      visit user_path('1')
      click_on('See all posts')
      expect(page).to have_current_path('/users/1/posts')
    end
  end
end
