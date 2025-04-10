class AccountsController < ApplicationController
  def index
    render json: Account.all
  end

  def show
    render json: find_user
  end

  private
  def find_user
    Account.find(params[:id])
  end
end
