require 'rails_helper'

RSpec.describe 'request spec testing for posts', type: :request do
  describe '- testing for posts controller' do
    it 'checks for correct response status, templtae, body to match with place holder text' do
      get '/users/1/posts'
      expect(response.status).to eq(200)
      expect(response).to render_template('posts/index')
      expect(response.body).to include("This page will show a Single User's posts and show posts comments")
    end

    it 'checks for correct response status, templtae, body to match with place holder text' do
      get '/users/1/posts/1'
      expect(response.status).to eq(200)
      expect(response).to render_template('posts/show')
      expect(response.body).to include('This page will show Post and its comments')
    end
  end
end
