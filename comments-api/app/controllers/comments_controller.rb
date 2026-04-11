class CommentsController < ApplicationController
  before_action :verify_comment, only: [:show, :update, :destroy]

  def index
    respond_with(Comment.all)
  end

  def create
    # Check if reply
    if comment_params[:parent_id].present?
      comment = verify_parent_comment(comment_params[:parent_id])
      return unless comment.is_a?(Comment)

      comment_params = comment_params.merge(comment_type: :reply)
    end

    @comment = Comment.new(comment_params.merge(account: current_user))

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
    respond_with(@comment)
  end

  def destroy
    @comment.destroy
    respond_no_content
  end

  private
  def verify_comment
    @comment = Comment.find(params[:id])
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
    params.require(:comment).permit(:content, :parent_id)
  rescue => error
    respond_with_bad_request(error)
  end
end
