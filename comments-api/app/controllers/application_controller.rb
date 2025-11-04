class ApplicationController < ActionController::API
  before_action :authenticate_requests

  def respond_with(data, status = :ok)
    render json: data, status: status
  end

  def respond_no_content
    render json: {}, status: 204
  end

  def respond_not_found(error_message)
    render json: { error: "Not Found!", message: error_message }, status: :not_found
  end

  def respond_with_bad_request(error_message)
    render json: { error: "Bad Request!", message: error_message}, status: :bad_request
  end

  def respond_with_conflict_error(error_message)
    render json: { error: "Conflict!", message: error_message }, status: :conflict
  end

  def respond_with_unprocessable_error(entity)
    render json: { error: "Unprocessable Entity!", message: entity.errors.full_messages }, status: :unprocessable_entity
  end

  def respond_with_errors(errors)
    render json: { errors: errors }, status: :unprocessable_entity
  end

  def respond_with_unauthorized(error_message)
    render json: { error: "Unauthorized!", message: error_message }, status: :unauthorized
  end

  private
  def authenticate_requests
    header = request.headers['Authorization']

    if header.present?
      token = header.split(" ").last

      begin
        decoded = JWT.decode(token, Rails.application.secret_key_base).first
        @current_user = Account.find(decoded["account_id"])
      rescue JWT::ExpiredSignature
        render json: { error: "Token has expired" }, status: :unauthorized
      rescue JWT::DecodeError
        render json: { error: "Invalid token" }, status: :unauthorized
      end
    else
      render json: { error: "Unauthorized" }, status: :unauthorized
    end
  end
end
