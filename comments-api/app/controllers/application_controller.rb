class ApplicationController < ActionController::API
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
end
