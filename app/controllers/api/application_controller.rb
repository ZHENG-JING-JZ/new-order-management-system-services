class API::ApplicationController < ActionController::API
  rescue_from ActionController::ParameterMissing, with: :param_missing
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  before_action :authenticate

  protected

  def authenticate
    client = APIClient.find_by(token: request.headers["X-AUTH-TOKEN"])
    render json: {error: 'permission denied'}, status: :unauthorized unless client.present?
  end

  def param_missing(exception)
    render json: {error: exception.message}.to_json, status: 400
    return
  end

  def not_found(exception)
    render json: {error: exception.message}.to_json, status: 404
    return
  end
end
