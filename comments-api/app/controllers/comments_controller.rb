class CommentsController < ApplicationController
  before_action :verify_comment, only: [:show, :update, :destroy]

  def index
    respond_with(Comment.all)
  end

  def create
    args = comment_params

    # Check if reply
    if args[:parent_id].present?
      comment = verify_parent_comment(args[:parent_id])
      return unless comment.is_a?(Comment)

      args = args.merge(comment_type: :reply)
    end

    @comment = Comment.new(args.merge(account: current_user))

    authorize @comment

    if @comment.save
      respond_with(@comment, :created)
    else
      render json: { errors: @comment.errors.full_messages }, status: :unprocessable_entity
    end
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

  def comment_params
    params.require(:comment).permit(:content, :parent_id)
  rescue => error
    respond_with_bad_request(error)
  end
end
