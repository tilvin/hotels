class CommentsController < ApplicationController

  before_action :set_room
  before_action :set_comment

  def new
    @comment = Comment.new
    authorize! :create, @comment
  end

  def create
    @comment = @room.comments.new(comment_params)
    @comment.user = current_user
    authorize! :create, @comment
    @comment.save
  end

  def edit
    authorize! :update, @comment
  end

  def update
    authorize! :update, @comment
    @comment.update(comment_params)
  end

  def destroy
    authorize! :destroy, @comment
    @comment.destroy
  end

  private

  def set_room
    @room = Room.find(params[:room_id])
  end

  def set_comment
    @comment = Comment.find(params[:id]) if params[:id]
  end

  def comment_params
    params.require(:comment).permit(:text, :user_id, :room_id)
  end
end
