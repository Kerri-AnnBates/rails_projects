class CommentsController < ApplicationController
  before_action :verify_comment, only: [:show, :update, :destroy]

  def index
    respond_with(Comment.all)
  end

  def create
    args = comment_params
    account = verify_account(args[:account_id])
    return unless account.is_a?(Account)

    # Check if reply
    if args[:parent_id].present?
      comment = verify_parent_comment(args[:parent_id])
      return unless comment.is_a?(Comment)

      args = args.merge(comment_type: :reply)
    end

    # TODO: take a look at this, to see if json renders, might need to switch to Comment.new()
    @comment = Comment.create(args)

    if @comment.save
      respond_with(@comment, :created)
    else
      render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity
    end
  rescue => e
    puts "Error: #{e.class} - #{e.message}"
  end

  def show
    respond_with(@comment)
  end

  def update
    @comment.update(comment_params)
  end

  def destroy
    @comment.destroy
    respond_no_content
  end

  private
  def verify_comment
    @comment = Comment.find([params[:id]])
  rescue => error
    respond_not_found(error.message)
  end

  def verify_parent_comment(comment_id)
    Comment.find(comment_id)
  rescue => error
    respond_not_found(error.message)
  end

  def verify_account(account_id)
    Account.find(account_id)
  rescue => error
    respond_not_found(error.message)
  end

  def comment_params
    params.require(:comment).permit(:content, :account_id, :parent_id)
  rescue => error
    respond_with_bad_request(error)
  end
end
