class ApplicationController < ActionController::API
  def respond_with(data, status = :ok)
    render json: data, status: status
  end

  def respond_no_content
    render json: {}, status: 204
  end

  def respond_not_found(error)
    render json: { error: 'Not Found!', message: error.message }, status: :not_found
  end

  def respond_with_bad_request(error)
    render json: { error: 'Bad Request!', message: error.message}, status: :bad_request
  end
end
