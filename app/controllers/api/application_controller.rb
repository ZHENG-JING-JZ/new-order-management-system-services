class API::ApplicationController < ActionController::API
  before_action :authenticate
  def authenticate
    client = APIClient.find_by(token: request.headers["X-AUTH-TOKEN"])
    render json: {error: 'permission denied'}, status: :unauthorized unless client.present?
  end
end
