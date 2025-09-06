class SessionsController < ApplicationController
  def create
    account = Account.find_by(username: params[:username])

    if account && account.authenticate(params[:password])
      payload = { account_id: account.id, exp: 24.hours.from_now.to_i }
      token = JWT.encode(payload, Rails.application.secret_key_base)
      render json: { token: token, account: account }, status: :ok
    else
      respond_with_unauthorized("Invalid username or password")
    end
  end

  def destroy
    render json: { message: "Logged out" }, status: :ok
  end
end
