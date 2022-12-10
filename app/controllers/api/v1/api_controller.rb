require 'json_web_token'

class Api::V1::ApiController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_default_format
  before_action :authenticate_token!

  private

  def set_default_format
    request.format = :json
  end

  def authenticate_token!
    header = request.headers['Authorization']
    header = header.split.last if header
    decoded = JsonWebToken.decode(header)
    @current_user = User.find(decoded[:user_id])
  rescue JWT::ExpiredSignature
    render json: { error: 'Auth Token Has expired' }, status: :unauthorized
  rescue JWT::DecodeError
    render json: { error: 'Invalid Token' }, status: :unauthorized
  end
end
