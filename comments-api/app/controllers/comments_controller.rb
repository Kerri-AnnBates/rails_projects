class CommentsController < ApplicationController
  before_action :verify_comment, only: [:show, :update, :destroy]

  def index
    respond_with(Comment.all)
  end

  def create
    @comment = Comment.create(comment_params)

    if @comment.save
      respond_with(@comment)
    else
      respond_with_bad_request
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
    respond_not_found("Comment with id #{params[:id]} not found!") unless @comment
  end

  def comment_params
    params.require(:comment).permit(:content, :account_id)
  rescue => error
    puts error
  end
end
