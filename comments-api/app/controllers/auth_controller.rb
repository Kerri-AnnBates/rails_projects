class AuthController < ApplicationController
  def login
    account = Account.find_by(username: params[:username])

    if account && account.authenticate(params[:password])
      payload = { account_id: account.id, exp: 24.hours.from_now.to_i }
      token = JWT.encode(payload, Rails.application.secret_key_base)
      render json: { token: token, account: account.as_json(only: [ :id, :username ]) }, status: :ok
    else
      respond_with_unauthorized("Invalid username or password")
    end
  end

  def logout
    render json: { message: "Logged out" }, status: :ok
  end
end
