class AccountsController < ApplicationController
  before_action :find_account, only: [ :show ]
  before_action :confirm_uniqueness, only: [ :create ]

  def index
    respond_with(Account.all)
  end

  def create
    args = account_params
    account = Account.new(args)

    if account.save
      render json: account.as_json(only: [ :id, :username, :created_at ]), status: :created
    else
      respond_with_unprocessable_error(account)
    end
  end

  def show
    respond_with(@account)
  end

  private
  def find_account
    @account = Account.find(params[:id])
  end

  def confirm_uniqueness
    if Account.find_by(username: params[:username])
      respond_with_conflict_error("Username already taken")
    end
  end
  
  def account_params
    params.permit(:username, :password)
  rescue => error
    respond_with_bad_request(error)
  end
end
