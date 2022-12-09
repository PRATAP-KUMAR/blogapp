class Api::V1::ApiController < ApplicationController
  before_action :set_default_format

  def index; end

  def show; end

  private

  def set_default_format
    request.format = :json
  end
end
