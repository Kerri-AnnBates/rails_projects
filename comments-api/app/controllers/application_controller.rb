class ApplicationController < ActionController::API
  def respond_with(data, status = :ok)
    render json: data, status: status
  end

  def respond_no_content
    render json: {}, status: 204
  end

  def respond_not_found(error = 'Not found!')
    render json: {error: error}, status: :not_found
  end

  def respond_with_bad_request(error = 'Bad request!')
    render json: {error: error}, status: :bad_request
  end
end
