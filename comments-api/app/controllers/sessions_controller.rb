class SessionsController < ApplicationController
  def create
    account = Account.find_by(username: params[:username])

    if account && account.authenticate(params[:password])
      session[:account_id] = account.id
      render json: account, status: :created
    else
      respond_with_unauthorized("Invalid username or password")
    end
  end

  def destroy
    session.delete :account_id
    head :no_content
  end
end
