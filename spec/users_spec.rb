require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = User.create(name: 'Test User',
                        photo: 'test photo link',
                        bio: 'Testing Tool',
                        posts_counter: 18)
  end

  context 'testing validation for User model' do
    it 'should validate user name cant be empty' do
      @user.name = nil
      expect(subject).to_not be_valid
    end
  end

  context 'testing method for User model' do
    it 'should have a user name = Test User' do
      expect(@user.name).to eq('Test User')
    end
  end
end
