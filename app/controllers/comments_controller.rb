class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]

  def index
    @comments = Comment.all
  end

  def show
  end

  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
    # @resource = Resource.find(params[:resource_id])
    @comment = Comment.create(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to :back
    else
      flash.now[:danger] = "error"
    end
  #API BS HERE
  end

  def update
  end

  def destroy
    @comment.destroy
  end

  private
  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:comment, :content, :resource_id, :user_id)
  end
end
