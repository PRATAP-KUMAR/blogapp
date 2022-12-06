require 'rails_helper'

RSpec.describe 'All Users', type: :system do
  subject do
    @user = User.new(
      name: 'some',
      posts_counter: 0,
      bio: 'some bio',
      photo: 'https://images.unsplash.com/photo-1601315488950-3b5047998b38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80'
    )
  end

  before { subject.save }

  describe 'User Index page', js: true do
    it 'I can see the username of all other users' do
      visit users_path(subject)
      page.has_content?(User.name)
    end

    it 'checks for user profile pic' do
      visit users_path(subject)
      page.has_content?('Screenshot Image')
      expect(page).to have_css('img')
    end

    it 'I can see the number of posts each user has written.' do
      visit users_path(subject)
      page.has_content?('number of posts: 0')
    end

    it "When I click on a user, I am redirected to that user's show page" do
      visit users_path(subject)
      expect(page).to have_current_path('/users.1')
    end
  end
end
