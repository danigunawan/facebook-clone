# frozen_string_literal: true

class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)
    if @comment.save
      redirect_to root_path
    else
      flash[:error] = 'There was an error with your comment'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:post_id, :comment)
  end
end
