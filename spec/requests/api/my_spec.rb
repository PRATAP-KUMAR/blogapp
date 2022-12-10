require 'swagger_helper'

RSpec.describe 'api/my', type: :request do
    path '/api/v1/users' do
        post 'Create a user' do
            tags 'Users'
            consumes 'application/json'
            parameter name: :user, in: :body, schema: {
                type: :object,
                properties: {
                    name: { type: :string },
                    email: { type: :string },
                    bio: { type: :string },
                    photo: { type: :string },
                    password: { type: :string },
                    post_counter: { type: :integer },
                    role: { type: :string },
                },
                required: [ 'name', 'email', 'bio', 'photo', 'password', 'post_counter', 'role']
            }
                
                response '201', 'user created' do
                    let(:user) {{ name: 'Joe', email: 'joe@email.com', bio: 'Teacher from Mexio', photo: 'http://some/url', password: 'password' }}
                    run_test!
                end

                response '422', 'invalid request' do
                    let(:user) {{name: 'maria'}}
                    run_test!
                end
        end
    end
end
