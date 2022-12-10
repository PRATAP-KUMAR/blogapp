class Api::V1::RegisterController < Api::V1::ApiController
  skip_before_action :authenticate_token!

  def register
    @user = User.create(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: { status: 'ERROR', message: 'User Not Created' }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.permit(:name, :email, :bio, :photo, :password, :post_counter, :role)
  end
end