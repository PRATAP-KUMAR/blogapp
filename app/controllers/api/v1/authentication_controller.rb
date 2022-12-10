class Api::V1::AuthenticationController < Api::V1::ApiController
  skip_before_action :authenticate_token!

  def login
    @user = User.find_by_email(params[:email])
    if @user&.valid_password?(params[:password])
      render json: { token: JsonWebToken.encode(user_id: @user.id) }
    else
      render json: { error: 'Invalid username/password' }, status: :unauthorized
    end
  end
end
