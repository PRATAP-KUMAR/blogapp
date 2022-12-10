require 'swagger_helper'

RSpec.describe 'Blog App API' do
    path '/api/v1/users' do
        post 'Creates user' do
            tags 'Users'
            consumes 'application/json', 'application/xml'
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
                required: [ 'name', 'email', 'bio', 'photo', 'password', 'post_counter', 'role' ]
            }

            response '201', 'user created' do
                let(:user) {
                            { name: 'Maria',
                                email: 'maria@email.com',
                                bio: 'Teacher from Mexico',
                                photo: 'http://some/url',
                                password: 'password',
                                post_counter: 1,
                                role: 'admin'
                                }
                            }
                run_test!
            end

            response '422', 'invalid request' do
                let(:user) {{ name: 'david' }}
                run_test!
            end
        end
    end

    path '/api/v1/users/' do
        get 'Retrieves The List of Users' do
            
            tags 'Users'
            produces 'application/json'
            # parameter name: :id, :in => :path, :type => :string
            response '200', 'list of users' do
                schema type: :object,
                properties: {
                    id: { type: :integer },
                    name: { type: :string },
                    email: { type: :string },
                    bio: { type: :string },
                    photo: { type: :string },
                    password: { type: :string },
                    post_counter: { type: :integer },
                    role: { type: :string },
                },
                required: [ 'id', 'name', 'email', 'bio', 'photo', 'password', 'post_counter', 'role' ]

                run_test!
            end
        end
    end
end