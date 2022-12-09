class Api::V1::PostsController < Api::V1::ApiController
  def index
    user_id = params[:user_id]
    @posts = User.find(user_id).posts
    render json: @posts, status: :ok
  end

  def show; end
end
