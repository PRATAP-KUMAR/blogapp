class Api::V1::UsersController < Api::V1::ApiController
  skip_before_action :authenticate_token!

  def index
    render json: User.all, status: :ok
  end

  def show
    render json: User.find(params[:id]), status: :ok
  end
end
