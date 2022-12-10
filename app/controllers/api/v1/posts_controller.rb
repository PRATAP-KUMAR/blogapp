class Api::V1::PostsController < Api::V1::ApiController
  skip_before_action :authenticate_token!

  def index
    user_id = params[:user_id]
    @posts = User.find(user_id).posts

    if @posts.empty?
      render json: { status: 'ERROR', message: 'No Posts Found' }, status: :not_found
    else
      render json: @posts, status: :ok
    end
  end
end
