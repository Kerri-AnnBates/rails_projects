class AccountsController < ApplicationController
  before_action :find_account, only: [:show]

  def index
    respond_with(Account.all)
  end

  def show
    respond_with(@account)
  end

  private
  def find_account
    @account = Account.find(params[:id])
  end
end
